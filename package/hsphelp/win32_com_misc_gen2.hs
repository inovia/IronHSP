;============================================================
;  COM (misc) ヘルプ ? CsWin32 / win32metadata から自動抽出
;  docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;============================================================

%index
IAdviseSink_OnDataChange
Called by the server to notify a data object's currently registered advise sinks that data in the object has changed.
%group
COM misc / IAdviseSink
%prm
this, pFormatetc, pStgmed
this : [comobj] IAdviseSink インターフェースの COM オブジェクト変数
pFormatetc : [var] A pointer to a FORMATETC structure, which describes the format, target device, rendering, and storage information of the calling data object.
pStgmed : [int] A pointer to a STGMEDIUM structure, which defines the storage medium (global memory, disk file, storage object, stream object, GDI object, or undefined) and ownership of that medium for the calling data object.
%inst
Called by the server to notify a data object's currently registered
advise sinks that data in the object has changed.

[備考]
Object handlers and containers of link objects implement
IAdviseSink::OnDataChange to take appropriate steps when notified
that data in the object has changed. They also must call
IDataObject::DAdvise to set up advisory connections with the objects
in whose data they are interested. Containers that take advantage of
OLE's caching support do not need to register for data-change
notifications, because the information necessary to update the
container's presentation of the object, including any changes in its
data, are maintained in the object's cache. Notes to Implementers If
you implement IAdviseSink::OnDataChange for a container, remember
that this method is asynchronous and that making synchronous calls
within asynchronous methods is not valid. Therefore, you cannot call
IDataObject::GetData to obtain the data you need to update your
object. Instead, you either post an internal message, or invalidate
the rectangle for the changed data by calling InvalidateRect and
waiting for a WM_PAINT message, at which point you are free to get
the data and update the object. The data itself, which is valid only
for the duration of the call, is passed using the storage medium
pointed to by pStgmed. Since the caller owns the medium, the advise
sink should not free it. Also, if pStgmed points to an IStorage or
IStream interface, the sink must not increment the reference count.


%index
IAdviseSink_OnViewChange
Notifies an object's registered advise sinks that its view has changed.
%group
COM misc / IAdviseSink
%prm
this, dwAspect, lindex
this : [comobj] IAdviseSink インターフェースの COM オブジェクト変数
dwAspect : [int] The aspect, or view, of the object. Contains a value taken from the DVASPECT enumeration.
lindex : [int] The portion of the view that has changed. Currently only -1 is valid.
%inst
Notifies an object's registered advise sinks that its view has
changed.

[備考]
Containers register to be notified when an object's view changes by
calling IViewObject::SetAdvise. After it is registered, the object
will call the sink's IAdviseSink::OnViewChange method when
appropriate. OnViewChange can be called when the object is in either
the loaded or running state. Even though DVASPECT values are
individual flag bits, dwAspect may represent only one value. That is,
dwAspect cannot contain the result of an OR operation combining two
or more DVASPECT values. The lindex parameter represents the part of
the aspect that is of interest. The value of lindex depends on the
value of dwAspect. If dwAspect is either DVASPECT_THUMBNAIL or
DVASPECT_ICON, lindex is ignored. If dwAspect is DVASPECT_CONTENT,
lindex must be -1, which indicates that the entire view is of
interest and is the only value that is currently valid.


%index
IAdviseSink_OnRename
Called by the server to notify all registered advisory sinks that the object has been renamed.
%group
COM misc / IAdviseSink
%prm
this, pmk
this : [comobj] IAdviseSink インターフェースの COM オブジェクト変数
pmk : [comobj] A pointer to the IMoniker interface on the new full moniker of the object.
%inst
Called by the server to notify all registered advisory sinks that the
object has been renamed.

[備考]
OLE link objects normally implement IAdviseSink::OnRename to receive
notification of a change in the name of a link source or its
container. The object serving as the link source calls OnRename and
passes its new full moniker to the object handler, which forwards the
notification to the link object. In response, the link object must
update its moniker. The link object, in turn, forwards the
notification to its own container.


%index
IAdviseSink_OnSave
Called by the server to notify all registered advisory sinks that the object has been saved.
%group
COM misc / IAdviseSink
%prm
this
this : [comobj] IAdviseSink インターフェースの COM オブジェクト変数
%inst
Called by the server to notify all registered advisory sinks that the
object has been saved.

[備考]
Object handlers and link objects normally implement
IAdviseSink::OnSave to receive notifications of when an object is
saved to disk, either to its original storage (through a Save
operation) or to new storage (through a Save As operation). Object
Handlers and link objects register to be notified when an object is
saved for the purpose of updating their caches, but then only if the
advise flag passed during registration specifies ADVFCACHE_ONSAVE.
Object handlers and link objects forward these notifications to their
containers.


%index
IAdviseSink_OnClose
Called by the server to notify all registered advisory sinks that the object has changed from the running to the loaded state.
%group
COM misc / IAdviseSink
%prm
this
this : [comobj] IAdviseSink インターフェースの COM オブジェクト変数
%inst
Called by the server to notify all registered advisory sinks that the
object has changed from the running to the loaded state.

[備考]
The OnClose notification indicates that an object is making the
transition from the running to the loaded state, so its container can
take appropriate measures to ensure an orderly shutdown. For example,
an object handler must release its pointer to the object. If the
object that is closing is the last open object supported by its OLE
server application, the application can also shut down. In the case
of a link object, the notification that the object is closing should
always be interpreted to mean that the connection to the link source
has broken.


%index
IBindCtx_RegisterObjectBound
Registers an object with the bind context to ensure that the object remains active until the bind context is released.
%group
COM misc / IBindCtx
%prm
this, punk
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
punk : [int] A pointer to the IUnknown interface on the object that is being registered as bound.
%inst
Registers an object with the bind context to ensure that the object
remains active until the bind context is released.

[戻り値]
This method can return the standard return values E_OUTOFMEMORY and
S_OK.

[備考]
Those writing a new moniker class (through an implementation of the
IMoniker interface) should call this method whenever the
implementation activates an object. This happens most often in the
course of binding a moniker, but it can also happen while retrieving
a moniker's display name, parsing a display name into a moniker, or
retrieving the time that an object was last modified.
RegisterObjectBound calls AddRef to create an additional reference to
the object. You must, however, still release your own copy of the
pointer. Calling this method twice for the same object creates two
references to that object. You can release a reference obtained
through a call to this method by calling IBindCtx::RevokeObjectBound.
All references held by the bind context are released when the bind
context itself is released. Calling RegisterObjectBound to register
an object with a bind context keeps the object active until the bind
context is released. Reusing a bind context in a subsequent binding
operation (either for another piece of the same composite moniker or
for a different moniker) can make the subsequent binding operation
more efficient because it doesn't have to reload that object. This,
however, improves performance only if the subsequent binding
operation requires some of the same objects as the original one, so
you need to balance the possible performance improvement of reusing a
bind context against the costs of keeping objects activated
unnecessarily.
IBindCtx does not provide a method to retrieve a pointer to an object
registered using RegisterObjectBound. Assuming the object has
registered itself with the running object table, moniker
implementations can call IRunningObjectTable::GetObject to retrieve a
pointer to the object.


%index
IBindCtx_RevokeObjectBound
Removes the object from the bind context, undoing a previous call to RegisterObjectBound.
%group
COM misc / IBindCtx
%prm
this, punk
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
punk : [int] A pointer to the IUnknown interface on the object to be removed.
%inst
Removes the object from the bind context, undoing a previous call to
RegisterObjectBound.

[戻り値]
This method can return the following values.
This doc was truncated.

[備考]
You would rarely call this method. It is documented primarily for
completeness.


%index
IBindCtx_ReleaseBoundObjects
Releases all pointers to all objects that were previously registered by calls to RegisterObjectBound.
%group
COM misc / IBindCtx
%prm
this
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
%inst
Releases all pointers to all objects that were previously registered
by calls to RegisterObjectBound.

[戻り値]
If this method succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
You rarely call this method directly. The system's IBindCtx
implementation calls this method when the pointer to the IBindCtx
interface on the bind context is released (the bind context is
released). If a bind context is not released, all of the registered
objects remain active. If the same object has been registered more
than once, this method calls the Release method on the object the
number of times it was registered.


%index
IBindCtx_SetBindOptions
Sets new values for the binding parameters stored in the bind context.
%group
COM misc / IBindCtx
%prm
this, pbindopts
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
pbindopts : [var] A pointer to a [BIND_OPTS3](/windows/win32/api/objidl/ns-objidl-bind_opts3-r1) structure containing the binding parameters.
%inst
Sets new values for the binding parameters stored in the bind
context.

[戻り値]
This method can return the standard return values E_OUTOFMEMORY and
S_OK.

[備考]
A bind context contains a block of parameters that are common to most
IMoniker operations. These parameters do not change as the operation
moves from piece to piece of a composite moniker. Subsequent binding
operations can call IBindCtx::GetBindOptions to retrieve these
parameters. Notes to Callers This method can be called by moniker
clients (those who use monikers to acquire interface pointers to
objects). When you first create a bind context by using the
CreateBindCtx function, the fields of the BIND_OPTS structure are
initialized to the following values:
This doc was truncated.


%index
IBindCtx_GetBindOptions
Retrieves the binding options stored in this bind context.
%group
COM misc / IBindCtx
%prm
this, pbindopts
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
pbindopts : [var] A pointer to an initialized structure that receives the current binding parameters on return. See [BIND_OPTS3](/windows/win32/api/objidl/ns-objidl-bind_opts3-r1).
%inst
Retrieves the binding options stored in this bind context.

[戻り値]
This method can return the standard return values E_UNEXPECTED and
S_OK.

[備考]
A bind context contains a block of parameters that are common to most
IMoniker operations and that do not change as the operation moves
from piece to piece of a composite moniker. Notes to Callers You
typically call this method if you are writing your own moniker class.
(This requires that you implement the IMoniker interface.) You call
this method to retrieve the parameters specified by the moniker
client. You must initialize the structure that is filled in by this
method. Before calling this method, you must initialize the cbStruct
member to the size of the structure.


%index
IBindCtx_GetRunningObjectTable
Retrieves an interface pointer to the running object table (ROT) for the computer on which this bind context is running.
%group
COM misc / IBindCtx
%prm
this, pprot
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
pprot : [comobj] The address of a IRunningObjectTable* pointer variable that receives the interface pointer to the running object table. If an error occurs, *pprot is set to NULL. If *pprot is non-NULL, the implementation calls AddRef on the running table object; it is the caller's responsibility to call Release.
%inst
Retrieves an interface pointer to the running object table (ROT) for
the computer on which this bind context is running.

[戻り値]
This method can return the standard return values E_OUTOFMEMORY,
E_UNEXPECTED, and S_OK.

[備考]
The running object table is a globally accessible table on each
computer. It keeps track of all the objects that are currently
running on the computer. Notes to Callers Typically, those
implementing a new moniker class (through an implementation of
IMoniker interface) call GetRunningObjectTable. It is useful to call
this method in an implementation of IMoniker::BindToObject or
IMoniker::IsRunning to check whether an object is currently running.
You can also call this method in the implementation of
IMoniker::GetTimeOfLastChange to learn when a running object was last
modified. Moniker implementations should call this method instead of
using the GetRunningObjectTable function. This makes it possible for
future implementations of IBindCtx to modify binding behavior.


%index
IBindCtx_RegisterObjectParam
Associates an object with a string key in the bind context's string-keyed table of pointers.
%group
COM misc / IBindCtx
%prm
this, pszKey, punk
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
pszKey : [wstr] The bind context string key under which the object is being registered. Key string comparison is case-sensitive.
punk : [int] A pointer to the IUnknown interface on the object that is to be registered. The method calls AddRef on the pointer.
%inst
Associates an object with a string key in the bind context's
string-keyed table of pointers.

[戻り値]
This method can return the standard return values E_OUTOFMEMORY and
S_OK.

[備考]
A bind context maintains a table of interface pointers, each
associated with a string key. This enables communication between a
moniker implementation and the caller that initiated the binding
operation. One party can store an interface pointer under a string
known to both parties so that the other party can later retrieve it
from the bind context. Binding operations subsequent to the use of
this method can use IBindCtx::GetObjectParam to retrieve the stored
pointer. Notes to Callers RegisterObjectParam is useful to those
implementing a new moniker class (through an implementation of
IMoniker) and to moniker clients (those who use monikers to bind to
objects). In implementing a new moniker class, you call this method
when an error occurs during moniker binding to inform the caller of
the cause of the error. The key that you would obtain with a call to
this method would depend on the error condition. Following is a list
of common moniker binding errors, describing for each the keys that
would be appropriate:
This doc was truncated.


%index
IBindCtx_GetObjectParam
Retrieves an interface pointer to the object associated with the specified key in the bind context's string-keyed table of pointers.
%group
COM misc / IBindCtx
%prm
this, pszKey, ppunk
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
pszKey : [wstr] The bind context string key to be searched for. Key string comparison is case-sensitive.
ppunk : [int] The address of an IUnknown* pointer variable that receives the interface pointer to the object associated with pszKey. When successful, the implementation calls AddRef on *ppunk. It is the caller's responsibility to call Release. If an error occurs, the implementation sets *ppunk to NULL.
%inst
Retrieves an interface pointer to the object associated with the
specified key in the bind context's string-keyed table of pointers.

[戻り値]
If the method succeeds, the return value is S_OK. Otherwise, it is
E_FAIL.

[備考]
A bind context maintains a table of interface pointers, each
associated with a string key. This enables communication between a
moniker implementation and the caller that initiated the binding
operation. One party can store an interface pointer under a string
known to both parties so that the other party can later retrieve it
from the bind context. The pointer this method retrieves must have
previously been inserted into the table using the
IBindCtx::RegisterObjectParam method. Notes to Callers Objects using
monikers to locate other objects can call this method when a binding
operation fails to get specific information about the error that
occurred. Depending on the error, it may be possible to correct the
situation and retry the binding operation. See
IBindCtx::RegisterObjectParam for more information. Moniker
implementations can call this method to handle situations where a
caller initiates a binding operation and requests specific
information. By convention, the implementer should use key names that
begin with the string form of the CLSID of a moniker class. (See the
StringFromCLSID function.)


%index
IBindCtx_EnumObjectParam
Retrieves a pointer to an interface that can be used to enumerate the keys of the bind context's string-keyed table of pointers.
%group
COM misc / IBindCtx
%prm
this, ppenum
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
ppenum : [comobj] The address of an IEnumString* pointer variable that receives the interface pointer to the enumerator. If an error occurs, *ppenum is set to NULL. If *ppenum is non-NULL, the implementation calls AddRef on *ppenum; it is the caller's responsibility to call Release.
%inst
Retrieves a pointer to an interface that can be used to enumerate the
keys of the bind context's string-keyed table of pointers.

[戻り値]
This method can return the standard return values E_OUTOFMEMORY and
S_OK.

[備考]
The keys returned by the enumerator are the ones previously specified
in calls to IBindCtx::RegisterObjectParam. Notes to Callers A bind
context maintains a table of interface pointers, each associated with
a string key. This enables communication between a moniker
implementation and the caller that initiated the binding operation.
One party can store an interface pointer under a string known to both
parties so that the other party can later retrieve it from the bind
context. In the system implementation of the IBindCtx interface, this
method is not implemented. Therefore, calling this method results in
a return value of E_NOTIMPL.


%index
IBindCtx_RevokeObjectParam
Removes the specified key and its associated pointer from the bind context's string-keyed table of objects. The key must have previously been inserted into the table with a call to RegisterObjectParam.
%group
COM misc / IBindCtx
%prm
this, pszKey
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
pszKey : [wstr] The bind context string key to be removed. Key string comparison is case-sensitive.
%inst
Removes the specified key and its associated pointer from the bind
context's string-keyed table of objects. The key must have previously
been inserted into the table with a call to RegisterObjectParam.

[戻り値]
This method can return the following values.
This doc was truncated.

[備考]
A bind context maintains a table of interface pointers, each
associated with a string key. This enables communication between a
moniker implementation and the caller that initiated the binding
operation. One party can store an interface pointer under a string
known to both parties so that the other party can later retrieve it
from the bind context. This method is used to remove an entry from
the table. If the specified key is found, the bind context also
releases its reference to the object.


%index
IBinding_Abort
IBinding::Abort (vtable slot 3)
%group
COM misc / IBinding
%prm
this
this : [comobj] IBinding インターフェースの COM オブジェクト変数
%inst


%index
IBinding_Suspend
IBinding::Suspend (vtable slot 4)
%group
COM misc / IBinding
%prm
this
this : [comobj] IBinding インターフェースの COM オブジェクト変数
%inst


%index
IBinding_Resume
IBinding::Resume (vtable slot 5)
%group
COM misc / IBinding
%prm
this
this : [comobj] IBinding インターフェースの COM オブジェクト変数
%inst


%index
IBinding_SetPriority
IBinding::SetPriority (vtable slot 6)
%group
COM misc / IBinding
%prm
this, nPriority
this : [comobj] IBinding インターフェースの COM オブジェクト変数
nPriority : [int] 
%inst


%index
IBinding_GetPriority
IBinding::GetPriority (vtable slot 7)
%group
COM misc / IBinding
%prm
this, pnPriority
this : [comobj] IBinding インターフェースの COM オブジェクト変数
pnPriority : [int] 
%inst


%index
IBinding_GetBindResult
IBinding::GetBindResult (vtable slot 8)
%group
COM misc / IBinding
%prm
this, pclsidProtocol, pdwResult, pszResult, pdwReserved
this : [comobj] IBinding インターフェースの COM オブジェクト変数
pclsidProtocol : [var] 
pdwResult : [int] 
pszResult : [var] 
pdwReserved : [int] 
%inst


%index
IBindStatusCallback_OnStartBinding
IBindStatusCallback::OnStartBinding (vtable slot 3)
%group
COM misc / IBindStatusCallback
%prm
this, dwReserved, pib
this : [comobj] IBindStatusCallback インターフェースの COM オブジェクト変数
dwReserved : [int] 
pib : [comobj] 
%inst


%index
IBindStatusCallback_GetPriority
IBindStatusCallback::GetPriority (vtable slot 4)
%group
COM misc / IBindStatusCallback
%prm
this, pnPriority
this : [comobj] IBindStatusCallback インターフェースの COM オブジェクト変数
pnPriority : [int] 
%inst


%index
IBindStatusCallback_OnLowResource
IBindStatusCallback::OnLowResource (vtable slot 5)
%group
COM misc / IBindStatusCallback
%prm
this, reserved
this : [comobj] IBindStatusCallback インターフェースの COM オブジェクト変数
reserved : [int] 
%inst


%index
IBindStatusCallback_OnProgress
IBindStatusCallback::OnProgress (vtable slot 6)
%group
COM misc / IBindStatusCallback
%prm
this, ulProgress, ulProgressMax, ulStatusCode, szStatusText
this : [comobj] IBindStatusCallback インターフェースの COM オブジェクト変数
ulProgress : [int] 
ulProgressMax : [int] 
ulStatusCode : [int] 
szStatusText : [wstr] 
%inst


%index
IBindStatusCallback_OnStopBinding
IBindStatusCallback::OnStopBinding (vtable slot 7)
%group
COM misc / IBindStatusCallback
%prm
this, hresult, szError
this : [comobj] IBindStatusCallback インターフェースの COM オブジェクト変数
hresult : [intptr] 
szError : [wstr] 
%inst


%index
IBindStatusCallback_GetBindInfo
IBindStatusCallback::GetBindInfo (vtable slot 8)
%group
COM misc / IBindStatusCallback
%prm
this, grfBINDF, pbindinfo
this : [comobj] IBindStatusCallback インターフェースの COM オブジェクト変数
grfBINDF : [int] 
pbindinfo : [int] 
%inst


%index
IBindStatusCallback_OnDataAvailable
IBindStatusCallback::OnDataAvailable (vtable slot 9)
%group
COM misc / IBindStatusCallback
%prm
this, grfBSCF, dwSize, pformatetc, pstgmed
this : [comobj] IBindStatusCallback インターフェースの COM オブジェクト変数
grfBSCF : [int] 
dwSize : [int] 
pformatetc : [var] 
pstgmed : [int] 
%inst


%index
IBindStatusCallback_OnObjectAvailable
IBindStatusCallback::OnObjectAvailable (vtable slot 10)
%group
COM misc / IBindStatusCallback
%prm
this, riid, punk
this : [comobj] IBindStatusCallback インターフェースの COM オブジェクト変数
riid : [var] 
punk : [int] 
%inst


%index
IDataObject_GetData
Called by a data consumer to obtain data from a source data object.
%group
COM misc / IDataObject
%prm
this, pformatetcIn, pmedium
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
pformatetcIn : [var] A pointer to the FORMATETC structure that defines the format, medium, and target device to use when passing the data. It is possible to specify more than one medium by using the Boolean OR operator, allowing the method to choose the best medium among those specified.
pmedium : [int] A pointer to the STGMEDIUM structure that indicates the storage medium containing the returned data through its tymed member, and the responsibility for releasing the medium through the value of its pUnkForRelease member. If pUnkForRelease is NULL, the receiver of the medium is responsible for releasing it; otherwise, pUnkForRelease points to the IUnknown on the appropriate object so its Release method can be called. The medium must be allocated and filled in by GetData.
%inst
Called by a data consumer to obtain data from a source data object.

[戻り値]
This method returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
A data consumer calls GetData to retrieve data from a data object,
conveyed through a storage medium (defined through the STGMEDIUM
structure). Notes to Callers You can specify more than one acceptable
tymed medium with the Boolean OR operator. GetData must choose from
the OR'd values the medium that best represents the data, do the
allocation, and indicate responsibility for releasing the medium.
Data transferred across a stream extends from position zero of the
stream pointer through to the position immediately before the current
stream pointer (that is, the stream pointer position upon exit).
Notes to Implementers GetData must check all fields in the FORMATETC
structure. It is important that GetData render the requested aspect
and, if possible, use the requested medium. If the data object cannot
comply with the information specified in the FORMATETC, the method
should return DV_E_FORMATETC. If an attempt to allocate the medium
fails, the method should return STG_E_MEDIUMFULL. It is important to
fill in all of the fields in the STGMEDIUM structure. Although the
caller can specify more than one medium for returning the data,
GetData can provide only one medium. If the initial transfer fails
with the selected medium, this method can be implemented to try one
of the other media specified before returning an error.


%index
IDataObject_GetDataHere
Called by a data consumer to obtain data from a source data object. This method differs from the GetData method in that the caller must allocate and free the specified storage medium.
%group
COM misc / IDataObject
%prm
this, pformatetc, pmedium
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
pformatetc : [var] A pointer to the FORMATETC structure that defines the format, medium, and target device to use when passing the data. Only one medium can be specified in tymed, and only the following values are valid: TYMED_ISTORAGE, TYMED_ISTREAM, TYMED_HGLOBAL, or TYMED_FILE.
pmedium : [int] A pointer to the STGMEDIUM structure that defines the storage medium containing the data being transferred. The medium must be allocated by the caller and filled in by GetDataHere. The caller must also free the medium. The implementation of this method must always supply a value of NULL for the punkForRelease member of the STGMEDIUM structure to which this parameter points.
%inst
Called by a data consumer to obtain data from a source data object.
This method differs from the GetData method in that the caller must
allocate and free the specified storage medium.

[戻り値]
This method returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The GetDataHere method is similar to IDataObject::GetData, except
that the caller must both allocate and free the medium specified in
pmedium. GetDataHere renders the data described in a FORMATETC
structure and copies the data into that caller-provided STGMEDIUM
structure. For example, if the medium is TYMED_HGLOBAL, this method
cannot resize the medium or allocate a new hGlobal. Some media are
not appropriate in a call to GetDataHere, including GDI types such as
metafiles. The GetDataHere method cannot put data into a
caller-provided metafile. In general, the only storage media it is
necessary to support in this method are TYMED_ISTORAGE,
TYMED_ISTREAM, and TYMED_FILE. When the transfer medium is a stream,
OLE makes assumptions about where the data is being returned and the
position of the stream's seek pointer. In a GetData call, the data
returned is from stream position zero through just before the current
seek pointer of the stream (that is, the position on exit). For
GetDataHere, the data returned is from the stream position on entry
through just before the position on exit.


%index
IDataObject_QueryGetData
Determines whether the data object is capable of rendering the data as specified. Objects attempting a paste or drop operation can call this method before calling IDataObject::GetData to get an indication of whether the operation may be successful.
%group
COM misc / IDataObject
%prm
this, pformatetc
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
pformatetc : [var] A pointer to the FORMATETC structure defining the format, medium, and target device to use for the query.
%inst
Determines whether the data object is capable of rendering the data
as specified. Objects attempting a paste or drop operation can call
this method before calling IDataObject::GetData to get an indication
of whether the operation may be successful.

[戻り値]
This method returns S_OK on success. Other possible values include
the following
This doc was truncated.

[備考]
The client of a data object calls QueryGetData to determine whether
passing the specified FORMATETC structure to a subsequent call to
IDataObject::GetData is likely to be successful. A successful return
from this method does not necessarily ensure the success of the
subsequent paste or drop operation.


%index
IDataObject_GetCanonicalFormatEtc
Provides a potentially different but logically equivalent FORMATETC structure. You use this method to determine whether two different FORMATETC structures would return the same data, removing the need for duplicate rendering.
%group
COM misc / IDataObject
%prm
this, pformatectIn, pformatetcOut
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
pformatectIn : [var] A pointer to the FORMATETC structure that defines the format, medium, and target device that the caller would like to use to retrieve data in a subsequent call such as IDataObject::GetData. The tymed member is not significant in this case and should be ignored.
pformatetcOut : [var] A pointer to a FORMATETC structure that contains the most general information possible for a specific rendering, making it canonically equivalent to pformatetcIn. The caller must allocate this structure and the GetCanonicalFormatEtc method must fill in the data. To retrieve data in a subsequent call like IDataObject::GetData, the caller uses the specified value of pformatetcOut, unless the value specified is NULL. This value is NULL if the method returns DATA_S_SAMEFORMATETC. The tymed member is not significant in this case and should be ignored.
%inst
Provides a potentially different but logically equivalent FORMATETC
structure. You use this method to determine whether two different
FORMATETC structures would return the same data, removing the need
for duplicate rendering.

[戻り値]
This method can return the following values.
This doc was truncated.

[備考]
If a data object can supply exactly the same data for more than one
requested FORMATETC structure, GetCanonicalFormatEtc can supply a
"canonical", or standard FORMATETC that gives the same rendering as a
set of more complicated FORMATETC structures. For example, it is
common for the data returned to be insensitive to the target device
specified in any one of a set of otherwise similar FORMATETC
structures. Notes to Callers A call to this method can determine
whether two calls to IDataObject::GetData on a data object,
specifying two different FORMATETC structures, would actually produce
the same renderings, thus eliminating the need for the second call
and improving performance. If the call to GetCanonicalFormatEtc
results in a canonical format being written to the pformatetcOut
parameter, the caller then uses that structure in a subsequent call
to IDataObject::GetData. Notes to Implementers Conceptually, it is
possible to think of FORMATETC structures in groups defined by a
canonical FORMATETC that provides the same results as each of the
group members. In constructing the canonical FORMATETC, you should
make sure it contains the most general information possible that
still produces a specific rendering. For data objects that never
provide device-specific renderings, the simplest implementation of
this method is to copy the input FORMATETC to the output FORMATETC,
store a NULL in the ptd member of the output FORMATETC, and return
DATA_S_SAMEFORMATETC.


%index
IDataObject_SetData
Called by an object containing a data source to transfer data to the object that implements this method.
%group
COM misc / IDataObject
%prm
this, pformatetc, pmedium, fRelease
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
pformatetc : [var] A pointer to the FORMATETC structure defining the format used by the data object when interpreting the data contained in the storage medium.
pmedium : [int] A pointer to the STGMEDIUM structure defining the storage medium in which the data is being passed.
fRelease : [int] If TRUE, the data object called, which implements SetData, owns the storage medium after the call returns. This means it must free the medium after it has been used by calling the ReleaseStgMedium function. If FALSE, the caller retains ownership of the storage medium and the data object called uses the storage medium for the duration of the call only.
%inst
Called by an object containing a data source to transfer data to the
object that implements this method.

[戻り値]
This method returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
SetData allows another object to attempt to send data to the
implementing data object. A data object implements this method if it
supports receiving data from another object. If it does not support
this, it should be implemented to return E_NOTIMPL. The caller
allocates the storage medium indicated by the pmedium parameter, in
which the data is passed. The data object called does not take
ownership of the data until it has successfully received it and no
error code is returned. The value of the fRelease parameter indicates
the ownership of the medium after the call returns. FALSE indicates
the caller still owns the medium, and the data object only has the
use of it during the call; TRUE indicates that the data object now
owns it and must release it when it is no longer needed. The type of
medium specified in the pformatetc and pmedium parameters must be the
same. For example, one cannot be a global handle and the other a
stream.


%index
IDataObject_EnumFormatEtc
Creates an object to enumerate the formats supported by a data object.
%group
COM misc / IDataObject
%prm
this, dwDirection, ppenumFormatEtc
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
dwDirection : [int] The direction of the data.  Possible values come from the DATADIR enumeration. The value DATADIR_GET enumerates the formats that can be passed in to a call to IDataObject::GetData. The value DATADIR_SET enumerates those formats that can be passed in to a call to IDataObject::SetData.
ppenumFormatEtc : [comobj] A pointer to an IEnumFORMATETC pointer variable that receives the interface pointer to the new enumerator object.
%inst
Creates an object to enumerate the formats supported by a data
object.

[戻り値]
This method returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
EnumFormatEtc creates an enumerator object that can be used to
determine all of the ways the data object can describe data in a
FORMATETC structure, and provides a pointer to its IEnumFORMATETC
interface. This is one of the standard enumerator interfaces. Notes
to Callers Having obtained the pointer, the caller can enumerate the
FORMATETC structures by calling the enumeration methods of
IEnumFORMATETC. Because the formats can change over time, there is no
guarantee that an enumerated format is currently supported because
the formats can change over time. Accordingly, applications should
treat the enumeration as a hint of the format types that can be
passed. The caller is responsible for calling Release when it is
finished with the enumerator. EnumFormatEtc is called when one of the
following actions occurs:
This doc was truncated.


%index
IDataObject_DAdvise
Called by an object supporting an advise sink to create a connection between a data object and the advise sink. This enables the advise sink to be notified of changes in the data of the object.
%group
COM misc / IDataObject
%prm
this, pformatetc, advf, pAdvSink, pdwConnection
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
pformatetc : [var] A pointer to a FORMATETC structure that defines the format, target device, aspect, and medium that will be used for future notifications. For example, one sink may want to know only when the bitmap representation of the data in the data object changes. Another sink may be interested in only the metafile format of the same object. Each advise sink is notified when the data of interest changes. This data is passed back to the advise sink when notification occurs.
advf : [int] A group of flags for controlling the advisory connection. Possible values are from the ADVF enumeration. However, only some of the possible ADVF values are relevant for this method. The following table briefly describes the relevant values.
pAdvSink : [comobj] A pointer to the IAdviseSink interface on the advisory sink that will receive the change notification.
pdwConnection : [int] A token that identifies this connection. You can use this token later to delete the advisory connection (by passing it to IDataObject::DUnadvise). If this value is 0, the connection was not established.
%inst
Called by an object supporting an advise sink to create a connection
between a data object and the advise sink. This enables the advise
sink to be notified of changes in the data of the object.

[戻り値]
This method returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
DAdvise creates a change notification connection between a data
object and the caller. The caller provides an advisory sink to which
the notifications can be sent when the object's data changes. Objects
used simply for data transfer typically do not support advisory
notifications and return OLE_E_ADVISENOTSUPPORTED from DAdvise. Notes
to Callers The object supporting the advise sink calls DAdvise to set
up the connection, specifying the format, aspect, medium, and/or
target device of interest in the FORMATETC structure passed in. If
the data object does not support one or more of the requested
attributes or the sending of notifications at all, it can refuse the
connection by returning OLE_E_ADVISENOTSUPPORTED. Containers of
linked objects can set up advisory connections directly with the
bound link source or indirectly through the standard OLE link object
that manages the connection. Connections set up with the bound link
source are not automatically deleted. The container must explicitly
call IDataObject::DUnadvise on the bound link source to delete an
advisory connection. The OLE link object, manipulated through the
IOleLink interface, is implemented in the default handler.
Connections set up through the OLE link object are destroyed when the
link object is deleted. The OLE default link object creates a
"wildcard advise" with the link source so OLE can maintain the time
of last change. This advise is specifically used to note the time
that anything changed. OLE ignores all data formats that may have
changed, noting only the time of last change. To allow wildcard
advises, set the FORMATETC members as follows before calling DAdvise:
This doc was truncated.


%index
IDataObject_DUnadvise
Destroys a notification connection that had been previously set up.
%group
COM misc / IDataObject
%prm
this, dwConnection
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
dwConnection : [int] A token that specifies the connection to be removed. Use the value returned by IDataObject::DAdvise when the connection was originally established.
%inst
Destroys a notification connection that had been previously set up.

[戻り値]
This method returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
This methods destroys a notification created with a call to the
IDataObject::DAdvise method. If the advisory connection being deleted
was initially set up by delegating the IDataObject::DAdvise call to
IDataAdviseHolder::Advise, you must delegate this call to
IDataAdviseHolder::Unadvise to delete it.


%index
IDataObject_EnumDAdvise
Creates an object that can be used to enumerate the current advisory connections.
%group
COM misc / IDataObject
%prm
this, ppenumAdvise
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
ppenumAdvise : [comobj] A pointer to an IEnumSTATDATA pointer variable that receives the interface pointer to the new enumerator object. If the implementation sets *ppenumAdvise to NULL, there are no connections to advise sinks at this time.
%inst
Creates an object that can be used to enumerate the current advisory
connections.

[戻り値]
This method returns S_OK if the enumerator object is successfully
instantiated or there are no connections. Other possible values
include the following.
This doc was truncated.

[備考]
The enumerator object created by this method implements the
IEnumSTATDATA interface. IEnumSTATDATA permits the enumeration of the
data stored in an array of STATDATA structures. Each of these
structures provides information on a single advisory connection, and
includes FORMATETC and ADVF information, as well as the pointer to
the advise sink and the token representing the connection. Notes to
Callers It is recommended that you use the OLE data advise holder
object to handle advisory connections. With the pointer obtained
through a call to CreateDataAdviseHolder, implementing
IDataObject::EnumDAdvise becomes a simple matter of delegating the
call to IDataAdviseHolder::EnumAdvise. This creates the enumerator
and supplies the pointer to the OLE implementation of IEnumSTATDATA.
At that point, you can call its methods to enumerate the current
advisory connections.


%index
IDropSource_QueryContinueDrag
Determines whether a drag-and-drop operation should be continued, canceled, or completed. You do not call this method directly. The OLE DoDragDrop function calls this method during a drag-and-drop operation.
%group
COM misc / IDropSource
%prm
this, fEscapePressed, grfKeyState
this : [comobj] IDropSource インターフェースの COM オブジェクト変数
fEscapePressed : [int] Indicates whether the Esc key has been pressed since the previous call to QueryContinueDrag or to DoDragDrop if this is the first call to QueryContinueDrag. A TRUE value indicates the end user has pressed the escape key; a FALSE value indicates it has not been pressed.
grfKeyState : [int] The current state of the keyboard modifier keys on the keyboard. Possible values can be a combination of any of the flags MK_CONTROL, MK_SHIFT, MK_ALT, MK_BUTTON, MK_LBUTTON, MK_MBUTTON, and MK_RBUTTON.
%inst
Determines whether a drag-and-drop operation should be continued,
canceled, or completed. You do not call this method directly. The OLE
DoDragDrop function calls this method during a drag-and-drop
operation.

[戻り値]
This method can return the following values.
This doc was truncated.

[備考]
The DoDragDrop function calls QueryContinueDrag whenever it detects a
change in the keyboard or mouse button state during a drag-and-drop
operation. QueryContinueDrag must determine whether the drag-and-drop
operation should be continued, canceled, or completed based on the
contents of the parameters grfKeyState and fEscapePressed.


%index
IDropSource_GiveFeedback
Enables a source application to give visual feedback to the end user during a drag-and-drop operation by providing the DoDragDrop function with an enumeration value specifying the visual effect.
%group
COM misc / IDropSource
%prm
this, dwEffect
this : [comobj] IDropSource インターフェースの COM オブジェクト変数
dwEffect : [int] The DROPEFFECT value returned by the most recent call to IDropTarget::DragEnter, IDropTarget::DragOver, or IDropTarget::DragLeave.
%inst
Enables a source application to give visual feedback to the end user
during a drag-and-drop operation by providing the DoDragDrop function
with an enumeration value specifying the visual effect.

[戻り値]
This method returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
When your application detects that the user has started a
drag-and-drop operation, it should call the DoDragDrop function.
DoDragDrop enters a loop, calling IDropTarget::DragEnter when the
mouse first enters a drop target window, IDropTarget::DragOver when
the mouse changes its position within the target window, and
IDropTarget::DragLeave when the mouse leaves the target window. For
every call to either IDropTarget::DragEnter or IDropTarget::DragOver,
DoDragDrop calls IDropSource::GiveFeedback, passing it the DROPEFFECT
value returned from the drop target call.
DoDragDrop calls IDropTarget::DragLeave when the mouse has left the
target window. Then, DoDragDrop calls IDropSource::GiveFeedback and
passes the DROPEFFECT_NONE value in the dwEffect parameter. The
dwEffect parameter can include DROPEFFECT_SCROLL, indicating that the
source should put up the drag-scrolling variation of the appropriate
pointer. Notes to Implementers This function is called frequently
during the DoDragDrop loop, so you can gain performance advantages if
you optimize your implementation as much as possible.
IDropSource::GiveFeedback is responsible for changing the cursor
shape or for changing the highlighted source based on the value of
the dwEffect parameter. If you are using default cursors, you can
return DRAGDROP_S_USEDEFAULTCURSORS, which causes OLE to update the
cursor for you, using its defaults.


%index
IDropTarget_DragEnter
Indicates whether a drop can be accepted, and, if so, the effect of the drop.
%group
COM misc / IDropTarget
%prm
this, pDataObj, grfKeyState, pt, pdwEffect
this : [comobj] IDropTarget インターフェースの COM オブジェクト変数
pDataObj : [comobj] A pointer to the IDataObject interface on the data object. This data object contains the data being transferred in the drag-and-drop operation. If the drop occurs, this data object will be incorporated into the target.
grfKeyState : [int] The current state of the keyboard modifier keys on the keyboard. Possible values can be a combination of any of the flags MK_CONTROL, MK_SHIFT, MK_ALT, MK_BUTTON, MK_LBUTTON, MK_MBUTTON, and MK_RBUTTON.
pt : [int] A POINTL structure containing the current cursor coordinates in screen coordinates.
pdwEffect : [var] On input, pointer to the value of the pdwEffect parameter of the DoDragDrop function. On return, must contain one of the DROPEFFECT flags, which indicates what the result of the drop operation would be.
%inst
Indicates whether a drop can be accepted, and, if so, the effect of
the drop.

[戻り値]
This method returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
You do not call DragEnter directly; instead the DoDragDrop function
calls it to determine the effect of a drop the first time the user
drags the mouse into the registered window of a drop target. To
implement DragEnter, you must determine whether the target can use
the data in the source data object by checking three things:
This doc was truncated.


%index
IDropTarget_DragOver
Provides target feedback to the user and communicates the drop's effect to the DoDragDrop function so it can communicate the effect of the drop back to the source.
%group
COM misc / IDropTarget
%prm
this, grfKeyState, pt, pdwEffect
this : [comobj] IDropTarget インターフェースの COM オブジェクト変数
grfKeyState : [int] The current state of the keyboard modifier keys on the keyboard. Valid values can be a combination of any of the flags MK_CONTROL, MK_SHIFT, MK_ALT, MK_BUTTON, MK_LBUTTON, MK_MBUTTON, and MK_RBUTTON.
pt : [int] A POINTL structure containing the current cursor coordinates in screen coordinates.
pdwEffect : [var] On input, pointer to the value of the pdwEffect parameter of the DoDragDrop function. On return, must contain one of the DROPEFFECT flags, which indicates what the result of the drop operation would be.
%inst
Provides target feedback to the user and communicates the drop's
effect to the DoDragDrop function so it can communicate the effect of
the drop back to the source.

[戻り値]
This method returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
You do not call DragOver directly. The DoDragDrop function calls this
method each time the user moves the mouse across a given target
window. DoDragDrop exits the loop if the drag-and-drop operation is
canceled, if the user drags the mouse out of the target window, or if
the drop is completed. In implementing IDropTarget::DragOver, you
must provide features similar to those in IDropTarget::DragEnter. You
must determine the effect of dropping the data on the target by
examining the FORMATETC defining the data object's formats and
medium, along with the state of the modifier keys. The mouse position
may also play a role in determining the effect of a drop. The
following modifier keys affect the result of the drop.
This doc was truncated.


%index
IDropTarget_DragLeave
Removes target feedback and releases the data object.
%group
COM misc / IDropTarget
%prm
this
this : [comobj] IDropTarget インターフェースの COM オブジェクト変数
%inst
Removes target feedback and releases the data object.

[戻り値]
This method returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
You do not call this method directly. The DoDragDrop function calls
this method in either of the following cases:
This doc was truncated.


%index
IDropTarget_Drop
Incorporates the source data into the target window, removes target feedback, and releases the data object.
%group
COM misc / IDropTarget
%prm
this, pDataObj, grfKeyState, pt, pdwEffect
this : [comobj] IDropTarget インターフェースの COM オブジェクト変数
pDataObj : [comobj] A pointer to the IDataObject interface on the data object being transferred in the drag-and-drop operation.
grfKeyState : [int] The current state of the keyboard modifier keys on the keyboard. Possible values can be a combination of any of the flags MK_CONTROL, MK_SHIFT, MK_ALT, MK_BUTTON, MK_LBUTTON, MK_MBUTTON, and MK_RBUTTON.
pt : [int] A POINTL structure containing the current cursor coordinates in screen coordinates.
pdwEffect : [var] On input, pointer to the value of the pdwEffect parameter of the DoDragDrop function. On return, must contain one of the DROPEFFECT flags, which indicates what the result of the drop operation would be.
%inst
Incorporates the source data into the target window, removes target
feedback, and releases the data object.

[戻り値]
This method returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
You do not call this method directly. The DoDragDrop function calls
this method when the user completes the drag-and-drop operation. In
implementing Drop, you must incorporate the data object into the
target. Use the formats available in IDataObject, available through
pDataObj, along with the current state of the modifier keys to
determine how the data is to be incorporated, such as linking or
embedding. In addition to incorporating the data, you must also clean
up as you do in the IDropTarget::DragLeave method:
This doc was truncated.


%index
IEnumFORMATETC_Next
Retrieves the specified number of items in the enumeration sequence. (IEnumFORMATETC.Next)
%group
COM misc / IEnumFORMATETC
%prm
this, celt, rgelt, pceltFetched
this : [comobj] IEnumFORMATETC インターフェースの COM オブジェクト変数
celt : [int] The number of items to be retrieved. If there are fewer than the requested number of items left in the sequence, this method retrieves the remaining elements.
rgelt : [var] An array of enumerated items. The enumerator is responsible for allocating any memory, and the caller is responsible for freeing it. If celt is greater than 1, the caller must also pass a non-NULL pointer passed to pceltFetched to know how many pointers to release.
pceltFetched : [var] The number of items that were retrieved. This parameter is always less than or equal to the number of items requested. This parameter can be NULL if celt is 1.
%inst
Retrieves the specified number of items in the enumeration sequence.
(IEnumFORMATETC.Next)

[戻り値]
If the method retrieves the number of items requested, the return
value is S_OK. Otherwise, it is S_FALSE.


%index
IEnumFORMATETC_Skip
Skips over the specified number of items in the enumeration sequence. (IEnumFORMATETC.Skip)
%group
COM misc / IEnumFORMATETC
%prm
this, celt
this : [comobj] IEnumFORMATETC インターフェースの COM オブジェクト変数
celt : [int] The number of items to be skipped.
%inst
Skips over the specified number of items in the enumeration sequence.
(IEnumFORMATETC.Skip)

[戻り値]
If the method skips the number of items requested, the return value
is S_OK. Otherwise, it is S_FALSE.


%index
IEnumFORMATETC_Reset
Resets the enumeration sequence to the beginning. (IEnumFORMATETC.Reset)
%group
COM misc / IEnumFORMATETC
%prm
this
this : [comobj] IEnumFORMATETC インターフェースの COM オブジェクト変数
%inst
Resets the enumeration sequence to the beginning.
(IEnumFORMATETC.Reset)

[戻り値]
This method returns S_OK on success.

[備考]
There is no guarantee that the same set of objects will be enumerated
after the reset operation has completed. A static collection is reset
to the beginning, but it can be too expensive for some collections,
such as files in a directory, to guarantee this condition.


%index
IEnumFORMATETC_Clone
Creates a new enumerator that contains the same enumeration state as the current one. (IEnumFORMATETC.Clone)
%group
COM misc / IEnumFORMATETC
%prm
this, ppenum
this : [comobj] IEnumFORMATETC インターフェースの COM オブジェクト変数
ppenum : [comobj] Address of an IEnumFORMATETC pointer variable that receives the interface pointer to the enumeration object. If the method is unsuccessful, the value of this output variable is undefined.
%inst
Creates a new enumerator that contains the same enumeration state as
the current one. (IEnumFORMATETC.Clone)

[戻り値]
This method returns S_OK on success. Other possible values include
the following.
This doc was truncated.


%index
IEnumMoniker_Next
Retrieves the specified number of items in the enumeration sequence. (IEnumMoniker.Next)
%group
COM misc / IEnumMoniker
%prm
this, celt, rgelt, pceltFetched
this : [comobj] IEnumMoniker インターフェースの COM オブジェクト変数
celt : [int] The number of items to be retrieved. If there are fewer than the requested number of items left in the sequence, this method retrieves the remaining elements.
rgelt : [comobj] An array of enumerated items. The enumerator is responsible for calling AddRef, and the caller is responsible for calling Release through each pointer enumerated. If celt is greater than 1, the caller must also pass a non-NULL pointer passed to pceltFetched to know how many pointers to release.
pceltFetched : [var] The number of items that were retrieved. This parameter is always less than or equal to the number of items requested. This parameter can be NULL if celt is 1.
%inst
Retrieves the specified number of items in the enumeration sequence.
(IEnumMoniker.Next)

[戻り値]
If the method retrieves the number of items requested, the return
value is S_OK. Otherwise, it is S_FALSE.


%index
IEnumMoniker_Skip
Skips over the specified number of items in the enumeration sequence. (IEnumMoniker.Skip)
%group
COM misc / IEnumMoniker
%prm
this, celt
this : [comobj] IEnumMoniker インターフェースの COM オブジェクト変数
celt : [int] The number of items to be skipped.
%inst
Skips over the specified number of items in the enumeration sequence.
(IEnumMoniker.Skip)

[戻り値]
If the method skips the number of items requested, the return value
is S_OK. Otherwise, it is S_FALSE.


%index
IEnumMoniker_Reset
Resets the enumeration sequence to the beginning. (IEnumMoniker.Reset)
%group
COM misc / IEnumMoniker
%prm
this
this : [comobj] IEnumMoniker インターフェースの COM オブジェクト変数
%inst
Resets the enumeration sequence to the beginning.
(IEnumMoniker.Reset)

[戻り値]
This method returns S_OK on success.

[備考]
There is no guarantee that the same set of objects will be enumerated
after the reset operation has completed. A static collection is reset
to the beginning, but it can be too expensive for some collections,
such as files in a directory, to guarantee this condition.


%index
IEnumMoniker_Clone
Creates a new enumerator that contains the same enumeration state as the current one. (IEnumMoniker.Clone)
%group
COM misc / IEnumMoniker
%prm
this, ppenum
this : [comobj] IEnumMoniker インターフェースの COM オブジェクト変数
ppenum : [comobj] Address of an IEnumMoniker pointer variable that receives the interface pointer to the enumeration object. If the method is unsuccessful, the value of this output variable is undefined.
%inst
Creates a new enumerator that contains the same enumeration state as
the current one. (IEnumMoniker.Clone)

[戻り値]
This method returns S_OK on success. Other possible values include
the following.
This doc was truncated.


%index
IEnumShellItems_Next
Gets an array of one or more IShellItem interfaces from the enumeration.
%group
COM misc / IEnumShellItems
%prm
this, celt, rgelt, pceltFetched
this : [comobj] IEnumShellItems インターフェースの COM オブジェクト変数
celt : [int] Type: ULONG The number of elements in the array referenced by the rgelt parameter.
rgelt : [comobj] Type: IShellItem** The address of an array of pointers to IShellItem interfaces that receive the enumerated item or items. The calling application is responsible for freeing the IShellItem interfaces by calling the IUnknown::Release method.
pceltFetched : [var] Type: ULONG* A pointer to a value that receives the number of IShellItem interfaces successfully retrieved. The count can be smaller than the value specified in the celt parameter. This parameter can be NULL on entry only if celt is one, because in that case the method can only retrieve one item and return S_OK, or zero items and return S_FALSE.
%inst
Gets an array of one or more IShellItem interfaces from the
enumeration.

[戻り値]
Type: HRESULT This method can return one of these values.
This doc was truncated.


%index
IEnumShellItems_Skip
Skips a given number of IShellItem interfaces in the enumeration. Used when retrieving interfaces.
%group
COM misc / IEnumShellItems
%prm
this, celt
this : [comobj] IEnumShellItems インターフェースの COM オブジェクト変数
celt : [int] Type: ULONG The number of IShellItem interfaces to skip.
%inst
Skips a given number of IShellItem interfaces in the enumeration.
Used when retrieving interfaces.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IEnumShellItems_Reset
Resets the internal count of retrieved IShellItem interfaces in the enumeration.
%group
COM misc / IEnumShellItems
%prm
this
this : [comobj] IEnumShellItems インターフェースの COM オブジェクト変数
%inst
Resets the internal count of retrieved IShellItem interfaces in the
enumeration.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IEnumShellItems_Clone
Gets a copy of the current enumeration.
%group
COM misc / IEnumShellItems
%prm
this, ppenum
this : [comobj] IEnumShellItems インターフェースの COM オブジェクト変数
ppenum : [comobj] Type: IEnumShellItems** The address of a pointer that receives a copy of this enumeration.
%inst
Gets a copy of the current enumeration.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IEnumSTATDATA_Next
Retrieves the specified number of items in the enumeration sequence. (IEnumSTATDATA.Next)
%group
COM misc / IEnumSTATDATA
%prm
this, celt, rgelt, pceltFetched
this : [comobj] IEnumSTATDATA インターフェースの COM オブジェクト変数
celt : [int] The number of items to be retrieved. If there are fewer than the requested number of items left in the sequence, this method retrieves the remaining elements.
rgelt : [int] An array of enumerated items. The enumerator is responsible for allocating any memory, and the caller is responsible for freeing it. If celt is greater than 1, the caller must also pass a non-NULL pointer passed to pceltFetched to know how many pointers to release.
pceltFetched : [var] The number of items that were retrieved. This parameter is always less than or equal to the number of items requested. This parameter can be NULL if celt is 1.
%inst
Retrieves the specified number of items in the enumeration sequence.
(IEnumSTATDATA.Next)

[戻り値]
If the method retrieves the number of items requested, the return
value is S_OK. Otherwise, it is S_FALSE.


%index
IEnumSTATDATA_Skip
Skips over the specified number of items in the enumeration sequence. (IEnumSTATDATA.Skip)
%group
COM misc / IEnumSTATDATA
%prm
this, celt
this : [comobj] IEnumSTATDATA インターフェースの COM オブジェクト変数
celt : [int] The number of items to be skipped.
%inst
Skips over the specified number of items in the enumeration sequence.
(IEnumSTATDATA.Skip)

[戻り値]
If the method skips the number of items requested, the return value
is S_OK. Otherwise, it is S_FALSE.


%index
IEnumSTATDATA_Reset
Resets the enumeration sequence to the beginning. (IEnumSTATDATA.Reset)
%group
COM misc / IEnumSTATDATA
%prm
this
this : [comobj] IEnumSTATDATA インターフェースの COM オブジェクト変数
%inst
Resets the enumeration sequence to the beginning.
(IEnumSTATDATA.Reset)

[戻り値]
This method returns S_OK on success.

[備考]
There is no guarantee that the same set of objects will be enumerated
after the reset operation has completed. A static collection is reset
to the beginning, but it can be too expensive for some collections,
such as files in a directory, to guarantee this condition.


%index
IEnumSTATDATA_Clone
Creates a new enumerator that contains the same enumeration state as the current one. (IEnumSTATDATA.Clone)
%group
COM misc / IEnumSTATDATA
%prm
this, ppenum
this : [comobj] IEnumSTATDATA インターフェースの COM オブジェクト変数
ppenum : [comobj] A pointer to an IEnumSTATDATA pointer variable that receives the interface pointer to the enumeration object. If the method is unsuccessful, the value of this output variable is undefined.
%inst
Creates a new enumerator that contains the same enumeration state as
the current one. (IEnumSTATDATA.Clone)

[戻り値]
This method returns S_OK on success. Other possible values include
the following.
This doc was truncated.


%index
IEnumString_Next
The IEnumString::Next (objidlbase.h) method retrieves the specified number of items in the enumeration sequence.
%group
COM misc / IEnumString
%prm
this, celt, rgelt, pceltFetched
this : [comobj] IEnumString インターフェースの COM オブジェクト変数
celt : [int] The number of items to be retrieved. If there are fewer than the requested number of items left in the sequence, this method retrieves the remaining elements.
rgelt : [var] An array of enumerated items. The enumerator is responsible for allocating any memory, and the caller is responsible for freeing it. If celt is greater than 1, the caller must also pass a non-NULL pointer passed to pceltFetched to know how many pointers to release.
pceltFetched : [var] The number of items that were retrieved. This parameter is always less than or equal to the number of items requested.
%inst
The IEnumString::Next (objidlbase.h) method retrieves the specified
number of items in the enumeration sequence.

[戻り値]
If the method retrieves the number of items requested, the return
value is S_OK. Otherwise, it is S_FALSE.


%index
IEnumString_Skip
The IEnumString::Skip (objidlbase.h) method skips over the specified number of items in the enumeration sequence.
%group
COM misc / IEnumString
%prm
this, celt
this : [comobj] IEnumString インターフェースの COM オブジェクト変数
celt : [int] The number of items to be skipped.
%inst
The IEnumString::Skip (objidlbase.h) method skips over the specified
number of items in the enumeration sequence.

[戻り値]
If the method skips the number of items requested, the return value
is S_OK. Otherwise, it is S_FALSE.


%index
IEnumString_Reset
The IEnumString::Reset (objidlbase.h) method resets the enumeration sequence to the beginning.
%group
COM misc / IEnumString
%prm
this
this : [comobj] IEnumString インターフェースの COM オブジェクト変数
%inst
The IEnumString::Reset (objidlbase.h) method resets the enumeration
sequence to the beginning.

[戻り値]
The return value is S_OK.

[備考]
There is no guarantee that the same set of objects will be enumerated
after the reset operation has completed. A static collection is reset
to the beginning, but it can be too expensive for some collections,
such as files in a directory, to guarantee this condition.


%index
IEnumString_Clone
The IEnumString::Clone (objidlbase.h) method creates a new enumerator that contains the same enumeration state as the current one.
%group
COM misc / IEnumString
%prm
this, ppenum
this : [comobj] IEnumString インターフェースの COM オブジェクト変数
ppenum : [comobj] A pointer to the cloned enumerator object.
%inst
The IEnumString::Clone (objidlbase.h) method creates a new enumerator
that contains the same enumeration state as the current one.

[戻り値]
This method can return the standard return values E_INVALIDARG,
E_OUTOFMEMORY, E_UNEXPECTED, and S_OK.


%index
IFileDialog_Show
IFileDialog::Show (vtable slot 3)
%group
COM misc / IFileDialog
%prm
this, hwndOwner
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
hwndOwner : [intptr] 
%inst


%index
IFileDialog_SetFileTypes
Sets the file types that the dialog can open or save.
%group
COM misc / IFileDialog
%prm
this, cFileTypes, rgFilterSpec
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
cFileTypes : [int] Type: UINT The number of elements in the array specified by rgFilterSpec.
rgFilterSpec : [var] Type: const COMDLG_FILTERSPEC* A pointer to an array of COMDLG_FILTERSPEC structures, each representing a file type.
%inst
Sets the file types that the dialog can open or save.

[戻り値]
Type: HRESULT If the method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code, including the following:
This doc was truncated.

[備考]
When using the Open dialog, the file types declared there are used to
filter the view. When using the Save dialog, these values determine
which file name extension is appended to the file name. This method
must be called before the dialog is shown and can only be called once
for each dialog instance. File types cannot be modified once the
Common Item dialog box is displayed.


%index
IFileDialog_SetFileTypeIndex
Sets the file type that appears as selected in the dialog.
%group
COM misc / IFileDialog
%prm
this, iFileType
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
iFileType : [int] Type: UINT The index of the file type in the file type array passed to IFileDialog::SetFileTypes in its cFileTypes parameter. Note that this is a one-based index, not zero-based.
%inst
Sets the file type that appears as selected in the dialog.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This method must be called before the dialog is showing.


%index
IFileDialog_GetFileTypeIndex
Gets the currently selected file type.
%group
COM misc / IFileDialog
%prm
this, piFileType
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
piFileType : [int] Type: UINT* A pointer to a UINT value that receives the index of the selected file type in the file type array passed to IFileDialog::SetFileTypes in its cFileTypes parameter. Note??This is a one-based index rather than zero-based.
%inst
Gets the currently selected file type.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
IFileDialog::GetFileTypeIndex can be called either while the dialog
is open or after it has closed.


%index
IFileDialog_Advise
Assigns an event handler that listens for events coming from the dialog.
%group
COM misc / IFileDialog
%prm
this, pfde, pdwCookie
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pfde : [comobj] Type: IFileDialogEvents* A pointer to an IFileDialogEvents implementation that will receive events from the dialog.
pdwCookie : [int] Type: DWORD* A pointer to a DWORD that receives a value identifying this event handler. When the client is finished with the dialog, that client must call the IFileDialog::Unadvise method with this value.
%inst
Assigns an event handler that listens for events coming from the
dialog.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IFileDialog_Unadvise
Removes an event handler that was attached through the IFileDialog::Advise method.
%group
COM misc / IFileDialog
%prm
this, dwCookie
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
dwCookie : [int] Type: DWORD The DWORD value that represents the event handler. This value is obtained through the pdwCookie parameter of the IFileDialog::Advise method.
%inst
Removes an event handler that was attached through the
IFileDialog::Advise method.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IFileDialog_SetOptions
Sets flags to control the behavior of the dialog.
%group
COM misc / IFileDialog
%prm
this, fos
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
fos : [int] Type: FILEOPENDIALOGOPTIONS One or more of the FILEOPENDIALOGOPTIONS values.
%inst
Sets flags to control the behavior of the dialog.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Generally, this method should take the value that was retrieved by
IFileDialog::GetOptions and modify it to include or exclude options
by setting the appropriate flags.


%index
IFileDialog_GetOptions
Gets the current flags that are set to control dialog behavior.
%group
COM misc / IFileDialog
%prm
this, pfos
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pfos : [var] Type: FILEOPENDIALOGOPTIONS* When this method returns successfully, points to a value made up of one or more of the FILEOPENDIALOGOPTIONS values.
%inst
Gets the current flags that are set to control dialog behavior.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IFileDialog_SetDefaultFolder
Sets the folder used as a default if there is not a recently used folder value available.
%group
COM misc / IFileDialog
%prm
this, psi
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
psi : [comobj] Type: IShellItem* A pointer to the interface that represents the folder.
%inst
Sets the folder used as a default if there is not a recently used
folder value available.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IFileDialog_SetFolder
Sets a folder that is always selected when the dialog is opened, regardless of previous user action.
%group
COM misc / IFileDialog
%prm
this, psi
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
psi : [comobj] Type: IShellItem* A pointer to the interface that represents the folder.
%inst
Sets a folder that is always selected when the dialog is opened,
regardless of previous user action.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This folder overrides any "most recently used" folder. If this method
is called while the dialog is displayed, it causes the dialog to
navigate to the specified folder. In general, we do not recommended
the use of this method. If you call SetFolder before you display the
dialog box, the most recent location that the user saved to or opened
from is not shown. Unless there is a very specific reason for this
behavior, it is not a good or expected user experience and should
therefore be avoided. In almost all instances,
IFileDialog::SetDefaultFolder is the better method. As of Windows 7,
if the path of the folder specified through psi is the default path
of a known folder, the known folder's current path is used in the
dialog. That path might not be the same as the path specified in psi;
for instance, if the known folder has been redirected. If the known
folder is a library (virtual folders Documents, Music, Pictures, and
Videos), the library's path is used in the dialog. If the specified
library is hidden (as they are by default as of Windows 8.1), the
library's default save location is used in the dialog, such as the
Microsoft OneDrive Documents folder for the Documents library.
Because of these mappings, the folder location used in the dialog
might not be exactly as you specified when you called this method.


%index
IFileDialog_GetFolder
Gets either the folder currently selected in the dialog, or, if the dialog is not currently displayed, the folder that is to be selected when the dialog is opened.
%group
COM misc / IFileDialog
%prm
this, ppsi
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] Type: IShellItem** The address of a pointer to the interface that represents the folder.
%inst
Gets either the folder currently selected in the dialog, or, if the
dialog is not currently displayed, the folder that is to be selected
when the dialog is opened.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The calling application is responsible for releasing the retrieved
IShellItem when it is no longer needed.


%index
IFileDialog_GetCurrentSelection
Gets the user's current selection in the dialog.
%group
COM misc / IFileDialog
%prm
this, ppsi
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] Type: IShellItem** The address of a pointer to the interface that represents the item currently selected in the dialog. This item can be a file or folder selected in the view window, or something that the user has entered into the dialog's edit box. The latter case may require a parsing operation (cancelable by the user) that blocks the current thread.
%inst
Gets the user's current selection in the dialog.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The calling application is responsible for releasing the retrieved
IShellItem when it is no longer needed.


%index
IFileDialog_SetFileName
Sets the file name that appears in the File name edit box when that dialog box is opened.
%group
COM misc / IFileDialog
%prm
this, pszName
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pszName : [wstr] Type: LPCWSTR A pointer to the name of the file.
%inst
Sets the file name that appears in the File name edit box when that
dialog box is opened.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IFileDialog_GetFileName
Retrieves the text currently entered in the dialog's File name edit box.
%group
COM misc / IFileDialog
%prm
this, pszName
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pszName : [var] Type: WCHAR** The address of a pointer to a buffer that, when this method returns successfully, receives the text.
%inst
Retrieves the text currently entered in the dialog's File name edit
box.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The text in the File name edit box does not necessarily reflect the
item the user chose. To get the item the user chose, use
IFileDialog::GetResult. The calling application is responsible for
releasing the retrieved buffer by using the CoTaskMemFree function.


%index
IFileDialog_SetTitle
Sets the title of the dialog.
%group
COM misc / IFileDialog
%prm
this, pszTitle
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pszTitle : [wstr] Type: LPCWSTR A pointer to a buffer that contains the title text.
%inst
Sets the title of the dialog.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IFileDialog_SetOkButtonLabel
Sets the text of the Open or Save button.
%group
COM misc / IFileDialog
%prm
this, pszText
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pszText : [wstr] Type: LPCWSTR A pointer to a buffer that contains the button text.
%inst
Sets the text of the Open or Save button.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IFileDialog_SetFileNameLabel
Sets the text of the label next to the file name edit box.
%group
COM misc / IFileDialog
%prm
this, pszLabel
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pszLabel : [wstr] Type: LPCWSTR A pointer to a buffer that contains the label text.
%inst
Sets the text of the label next to the file name edit box.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IFileDialog_GetResult
Gets the choice that the user made in the dialog.
%group
COM misc / IFileDialog
%prm
this, ppsi
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] Type: IShellItem** The address of a pointer to an IShellItem that represents the user's choice.
%inst
Gets the choice that the user made in the dialog.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
IFileDialog::GetResult can be called after the dialog has closed or
during the handling of an OnFileOk event. Calling this method at any
other time will fail. If multiple items were chosen, this method will
fail. In the case of multiple items, call GetResults
Show must return a success code for a result to be available to
IFileDialog::GetResult.


%index
IFileDialog_AddPlace
Adds a folder to the list of places available for the user to open or save items.
%group
COM misc / IFileDialog
%prm
this, psi, fdap
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
psi : [comobj] Type: IShellItem* A pointer to an IShellItem that represents the folder to be made available to the user. This can only be a folder.
fdap : [int] Type: FDAP Specifies where the folder is placed within the list. See FDAP.
%inst
Adds a folder to the list of places available for the user to open or
save items.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
SHSetTemporaryPropertyForItem can be used to set a temporary
PKEY_ItemNameDisplay property on the item represented by the psi
parameter. The value for this property will be used in place of the
item's UI name.


%index
IFileDialog_SetDefaultExtension
Sets the default extension to be added to file names.
%group
COM misc / IFileDialog
%prm
this, pszDefaultExtension
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pszDefaultExtension : [wstr] Type: LPCWSTR A pointer to a buffer that contains the extension text. This string should not include a leading period. For example, "jpg" is correct, while ".jpg" is not.
%inst
Sets the default extension to be added to file names.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
If this method is called before showing the dialog, the dialog will
update the default extension automatically when the user chooses a
new file type (see SetFileTypes).


%index
IFileDialog_Close
Closes the dialog.
%group
COM misc / IFileDialog
%prm
this, hr
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
hr : [intptr] Type: HRESULT The code that will be returned by Show to indicate that the dialog was closed before a selection was made.
%inst
Closes the dialog.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
An application can call this method from a callback method or
function while the dialog is open. The dialog will close and the Show
method will return with the HRESULT specified in hr. If this method
is called, there is no result available for the
IFileDialog::GetResult or GetResults methods, and they will fail if
called.


%index
IFileDialog_SetClientGuid
Enables a calling application to associate a GUID with a dialog's persisted state.
%group
COM misc / IFileDialog
%prm
this, guid
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
guid : [var] Type: REFGUID The GUID to associate with this dialog state.
%inst
Enables a calling application to associate a GUID with a dialog's
persisted state.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
A dialog's state can include factors such as the last visited folder
and the position and size of the dialog. Typically, this state is
persisted based on the name of the executable file. By specifying a
GUID, an application can have different persisted states for
different versions of the dialog within the same application (for
example, an import dialog and an open dialog).
IFileDialog::SetClientGuid should be called immediately after
creation of the dialog object.


%index
IFileDialog_ClearClientData
Instructs the dialog to clear all persisted state information.
%group
COM misc / IFileDialog
%prm
this
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
%inst
Instructs the dialog to clear all persisted state information.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Persisted information can be associated with an application or a
GUID. If a GUID was set by using IFileDialog::SetClientGuid, that
GUID is used to clear persisted information.


%index
IFileDialog_SetFilter
SetFilter is no longer available for use as of Windows?7.
%group
COM misc / IFileDialog
%prm
this, pFilter
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pFilter : [comobj] Type: IShellItemFilter* A pointer to the IShellItemFilter that is to be set.
%inst
SetFilter is no longer available for use as of Windows 7.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This method can be used if the application needs to perform special
filtering to remove some items from the dialog box's view.
IncludeItem will be called for each item that would normally be
included in the view. GetEnumFlagsForItem is not used. To filter by
file type, IFileDialog::SetFileTypes should be used, because in
folders with a large number of items it may offer better performance
than applying an IShellItemFilter.


%index
IFileDialogEvents_OnFileOk
Called just before the dialog is about to return with a result.
%group
COM misc / IFileDialogEvents
%prm
this, pfd
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] Type: IFileDialog* A pointer to the interface that represents the dialog.
%inst
Called just before the dialog is about to return with a result.

[戻り値]
Type: HRESULT Implementations should return S_OK to accept the
current result in the dialog or S_FALSE to refuse it. In the case of
S_FALSE, the dialog should remain open.

[備考]
When this method is called, the IFileDialog::GetResult and GetResults
methods can be called. The application can use this callback method
to perform additional validation before the dialog closes, or to
prevent the dialog from closing. If the application prevents the
dialog from closing, it should display a UI to indicate a cause. To
obtain a parent HWND for the UI, obtain the IOleWindow interface
through IFileDialog::QueryInterface and call IOleWindow::GetWindow.
An application can also use this method to perform all of its work
surrounding the opening or saving of files.


%index
IFileDialogEvents_OnFolderChanging
Called before IFileDialogEvents::OnFolderChange. This allows the implementer to stop navigation to a particular location.
%group
COM misc / IFileDialogEvents
%prm
this, pfd, psiFolder
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] Type: IFileDialog* A pointer to the interface that represents the dialog.
psiFolder : [comobj] Type: IShellItem* A pointer to an interface that represents the folder to which the dialog is about to navigate.
%inst
Called before IFileDialogEvents::OnFolderChange. This allows the
implementer to stop navigation to a particular location.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise. A return value of S_OK or E_NOTIMPL indicates that the
folder change can proceed.

[備考]
The calling application can call IFileDialog::SetFolder during this
callback to redirect navigation to an alternate folder. The actual
navigation does not occur until IFileDialogEvents::OnFolderChanging
has returned. If the calling application simply prevents navigation
to a particular folder, UI should be displayed with an explanation of
the restriction. To obtain a parent HWND for the UI, obtain the
IOleWindow interface through IFileDialog and call
IOleWindow::GetWindow.


%index
IFileDialogEvents_OnFolderChange
Called when the user navigates to a new folder.
%group
COM misc / IFileDialogEvents
%prm
this, pfd
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] Type: IFileDialog* A pointer to the interface that represents the dialog.
%inst
Called when the user navigates to a new folder.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
IFileDialogEvents::OnFolderChange is called when the dialog is
opened.


%index
IFileDialogEvents_OnSelectionChange
Called when the user changes the selection in the dialog's view.
%group
COM misc / IFileDialogEvents
%prm
this, pfd
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] Type: IFileDialog* A pointer to the interface that represents the dialog.
%inst
Called when the user changes the selection in the dialog's view.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IFileDialogEvents_OnShareViolation
Enables an application to respond to sharing violations that arise from Open or Save operations.
%group
COM misc / IFileDialogEvents
%prm
this, pfd, psi, pResponse
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] Type: IFileDialog* A pointer to the interface that represents the dialog.
psi : [comobj] Type: IShellItem* A pointer to the interface that represents the item that has the sharing violation.
pResponse : [var] Type: FDE_SHAREVIOLATION_RESPONSE* A pointer to a value from the FDE_SHAREVIOLATION_RESPONSE enumeration indicating the response to the sharing violation.
%inst
Enables an application to respond to sharing violations that arise
from Open or Save operations.

[戻り値]
Type: HRESULT The implementer should return E_NOTIMPL if this method
is not implemented; S_OK or an appropriate error code otherwise.

[備考]
The FOS_SHAREAWARE flag must be set through IFileDialog::SetOptions
before this method is called. A sharing violation could possibly
arise when the application attempts to open a file, because the file
could have been locked between the time that the dialog tested it and
the application opened it.


%index
IFileDialogEvents_OnTypeChange
Called when the dialog is opened to notify the application of the initial chosen filetype.
%group
COM misc / IFileDialogEvents
%prm
this, pfd
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] Type: IFileDialog* A pointer to the interface that represents the dialog.
%inst
Called when the dialog is opened to notify the application of the
initial chosen filetype.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This method is called when the dialog is opened to notify the
application of the initially chosen filetype. If the application has
code in IFileDialogEvents that responds to type changes, it can
respond to the type. For example, it could hide certain controls. The
application controls the initial file type and could do its own
checks, so this method is provided as a convenience.


%index
IFileDialogEvents_OnOverwrite
Called from the save dialog when the user chooses to overwrite a file.
%group
COM misc / IFileDialogEvents
%prm
this, pfd, psi, pResponse
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] Type: IFileDialog* A pointer to the interface that represents the dialog.
psi : [comobj] Type: IShellItem* A pointer to the interface that represents the item that will be overwritten.
pResponse : [var] Type: FDE_OVERWRITE_RESPONSE* A pointer to a value from the FDE_OVERWRITE_RESPONSE enumeration indicating the response to the potential overwrite action.
%inst
Called from the save dialog when the user chooses to overwrite a
file.

[戻り値]
Type: HRESULT The implementer should return E_NOTIMPL if this method
is not implemented; S_OK or an appropriate error code otherwise.

[備考]
The FOS_OVERWRITEPROMPT flag must be set through
IFileDialog::SetOptions before this method is called.


%index
IFileOpenDialog_Show
IFileOpenDialog::Show (vtable slot 3)
%group
COM misc / IFileOpenDialog
%prm
this, hwndOwner
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
hwndOwner : [intptr] 
%inst


%index
IFileOpenDialog_SetFileTypes
IFileOpenDialog::SetFileTypes (vtable slot 4)
%group
COM misc / IFileOpenDialog
%prm
this, cFileTypes, rgFilterSpec
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
cFileTypes : [int] 
rgFilterSpec : [var] 
%inst


%index
IFileOpenDialog_SetFileTypeIndex
IFileOpenDialog::SetFileTypeIndex (vtable slot 5)
%group
COM misc / IFileOpenDialog
%prm
this, iFileType
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
iFileType : [int] 
%inst


%index
IFileOpenDialog_GetFileTypeIndex
IFileOpenDialog::GetFileTypeIndex (vtable slot 6)
%group
COM misc / IFileOpenDialog
%prm
this, piFileType
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
piFileType : [int] 
%inst


%index
IFileOpenDialog_Advise
IFileOpenDialog::Advise (vtable slot 7)
%group
COM misc / IFileOpenDialog
%prm
this, pfde, pdwCookie
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
pfde : [comobj] 
pdwCookie : [int] 
%inst


%index
IFileOpenDialog_Unadvise
IFileOpenDialog::Unadvise (vtable slot 8)
%group
COM misc / IFileOpenDialog
%prm
this, dwCookie
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
dwCookie : [int] 
%inst


%index
IFileOpenDialog_SetOptions
IFileOpenDialog::SetOptions (vtable slot 9)
%group
COM misc / IFileOpenDialog
%prm
this, fos
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
fos : [int] 
%inst


%index
IFileOpenDialog_GetOptions
IFileOpenDialog::GetOptions (vtable slot 10)
%group
COM misc / IFileOpenDialog
%prm
this, pfos
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
pfos : [var] 
%inst


%index
IFileOpenDialog_SetDefaultFolder
IFileOpenDialog::SetDefaultFolder (vtable slot 11)
%group
COM misc / IFileOpenDialog
%prm
this, psi
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
psi : [comobj] 
%inst


%index
IFileOpenDialog_SetFolder
IFileOpenDialog::SetFolder (vtable slot 12)
%group
COM misc / IFileOpenDialog
%prm
this, psi
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
psi : [comobj] 
%inst


%index
IFileOpenDialog_GetFolder
IFileOpenDialog::GetFolder (vtable slot 13)
%group
COM misc / IFileOpenDialog
%prm
this, ppsi
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] 
%inst


%index
IFileOpenDialog_GetCurrentSelection
IFileOpenDialog::GetCurrentSelection (vtable slot 14)
%group
COM misc / IFileOpenDialog
%prm
this, ppsi
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] 
%inst


%index
IFileOpenDialog_SetFileName
IFileOpenDialog::SetFileName (vtable slot 15)
%group
COM misc / IFileOpenDialog
%prm
this, pszName
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
pszName : [wstr] 
%inst


%index
IFileOpenDialog_GetFileName
IFileOpenDialog::GetFileName (vtable slot 16)
%group
COM misc / IFileOpenDialog
%prm
this, pszName
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
pszName : [var] 
%inst


%index
IFileOpenDialog_SetTitle
IFileOpenDialog::SetTitle (vtable slot 17)
%group
COM misc / IFileOpenDialog
%prm
this, pszTitle
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
pszTitle : [wstr] 
%inst


%index
IFileOpenDialog_SetOkButtonLabel
IFileOpenDialog::SetOkButtonLabel (vtable slot 18)
%group
COM misc / IFileOpenDialog
%prm
this, pszText
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
pszText : [wstr] 
%inst


%index
IFileOpenDialog_SetFileNameLabel
IFileOpenDialog::SetFileNameLabel (vtable slot 19)
%group
COM misc / IFileOpenDialog
%prm
this, pszLabel
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
pszLabel : [wstr] 
%inst


%index
IFileOpenDialog_GetResult
IFileOpenDialog::GetResult (vtable slot 20)
%group
COM misc / IFileOpenDialog
%prm
this, ppsi
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] 
%inst


%index
IFileOpenDialog_AddPlace
IFileOpenDialog::AddPlace (vtable slot 21)
%group
COM misc / IFileOpenDialog
%prm
this, psi, fdap
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
psi : [comobj] 
fdap : [int] 
%inst


%index
IFileOpenDialog_SetDefaultExtension
IFileOpenDialog::SetDefaultExtension (vtable slot 22)
%group
COM misc / IFileOpenDialog
%prm
this, pszDefaultExtension
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
pszDefaultExtension : [wstr] 
%inst


%index
IFileOpenDialog_Close
IFileOpenDialog::Close (vtable slot 23)
%group
COM misc / IFileOpenDialog
%prm
this, hr
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
hr : [intptr] 
%inst


%index
IFileOpenDialog_SetClientGuid
IFileOpenDialog::SetClientGuid (vtable slot 24)
%group
COM misc / IFileOpenDialog
%prm
this, guid
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
guid : [var] 
%inst


%index
IFileOpenDialog_ClearClientData
IFileOpenDialog::ClearClientData (vtable slot 25)
%group
COM misc / IFileOpenDialog
%prm
this
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
%inst


%index
IFileOpenDialog_SetFilter
IFileOpenDialog::SetFilter (vtable slot 26)
%group
COM misc / IFileOpenDialog
%prm
this, pFilter
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
pFilter : [comobj] 
%inst


%index
IFileOpenDialog_GetResults
Gets the user's choices in a dialog that allows multiple selection.
%group
COM misc / IFileOpenDialog
%prm
this, ppenum
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
ppenum : [comobj] Type: IShellItemArray** The address of a pointer to an IShellItemArray through which the items selected in the dialog can be accessed.
%inst
Gets the user's choices in a dialog that allows multiple selection.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This method can be used whether the selection consists of a single
item or multiple items. IFileOpenDialog::GetResults can be called
after the dialog has closed or during the handling of an
IFileDialogEvents::OnFileOk event. Calling this method at any other
time will fail.
Show must return a success code for a result to be available to
IFileOpenDialog::GetResults.


%index
IFileOpenDialog_GetSelectedItems
Gets the currently selected items in the dialog. These items may be items selected in the view, or text selected in the file name edit box.
%group
COM misc / IFileOpenDialog
%prm
this, ppsai
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
ppsai : [comobj] Type: IShellItemArray** The address of a pointer to an IShellItemArray through which the selected items can be accessed.
%inst
Gets the currently selected items in the dialog. These items may be
items selected in the view, or text selected in the file name edit
box.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This method can be used for single item or multiple item selections.
If the user has entered new text in the file name field, this can be
a time-consuming operation. When the application calls this method,
the application parses the text in the filename field. For example,
if this is a network share, the operation could take some time.
However, this operation will not block the UI, since the user should
able to stop the operation, which will result in
IFileOpenDialog::GetSelectedItems returning a failure code).


%index
IFileOperationProgressSink_StartOperations
Performs caller-implemented actions before any specific file operations are performed.
%group
COM misc / IFileOperationProgressSink
%prm
this
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
%inst
Performs caller-implemented actions before any specific file
operations are performed.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
StartOperations is the first of the IFileOperationProgressSink
methods to be called after PerformOperations. It can be used to
perform any setup or initialization that you require before the file
operations begin.


%index
IFileOperationProgressSink_FinishOperations
Performs caller-implemented actions after the last operation performed by the call to IFileOperation is complete.
%group
COM misc / IFileOperationProgressSink
%prm
this, hrResult
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
hrResult : [intptr] Type: HRESULT The return value of the final operation. Note that this is not the HRESULT returned by one of the IFileOperation methods, which simply queue the operations. Instead, this is the result of the actual operation, such as copy, delete, or move.
%inst
Performs caller-implemented actions after the last operation
performed by the call to IFileOperation is complete.

[戻り値]
Type: HRESULT Not used.


%index
IFileOperationProgressSink_PreRenameItem
Performs caller-implemented actions before the rename process for each item begins.
%group
COM misc / IFileOperationProgressSink
%prm
this, dwFlags, psiItem, pszNewName
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
dwFlags : [int] Type: DWORD bitwise value that contains flags that control the operation. See TRANSFER_SOURCE_FLAGS for flag descriptions.
psiItem : [comobj] Type: IShellItem* Pointer to an IShellItem that specifies the item to be renamed.
pszNewName : [wstr] Type: LPCWSTR Pointer to the new display name of the item. This is a null-terminated, Unicode string.
%inst
Performs caller-implemented actions before the rename process for
each item begins.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise. In the case of an error value, the rename operation and
all subsequent operations pending from the call to IFileOperation are
canceled.


%index
IFileOperationProgressSink_PostRenameItem
Performs caller-implemented actions after the rename process for each item is complete.
%group
COM misc / IFileOperationProgressSink
%prm
this, dwFlags, psiItem, pszNewName, hrRename, psiNewlyCreated
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
dwFlags : [int] Type: DWORD bitwise value that contains flags that were used during the rename operation. Some values can be set or changed during the rename operation. See TRANSFER_SOURCE_FLAGS for flag descriptions.
psiItem : [comobj] Type: IShellItem* Pointer to an IShellItem that specifies the item before it was renamed.
pszNewName : [wstr] Type: LPCWSTR Pointer to the new display name of the item. This is a null-terminated, Unicode string. Note that this might not be the name that you asked for, given collisions and other naming rules.
hrRename : [intptr] Type: HRESULT The return value of the rename operation. Note that this is not the HRESULT returned by RenameItem, which simply queues the rename operation. Instead, this is the result of the actual rename operation.
psiNewlyCreated : [comobj] Type: IShellItem* Pointer to an IShellItem that represents the item with its new name.
%inst
Performs caller-implemented actions after the rename process for each
item is complete.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise. In the case of an error value, all subsequent operations
pending from the call to IFileOperation are canceled.


%index
IFileOperationProgressSink_PreMoveItem
Performs caller-implemented actions before the move process for each item begins.
%group
COM misc / IFileOperationProgressSink
%prm
this, dwFlags, psiItem, psiDestinationFolder, pszNewName
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
dwFlags : [int] Type: DWORD bitwise value that contains flags that control the operation. See TRANSFER_SOURCE_FLAGS for flag descriptions.
psiItem : [comobj] Type: IShellItem* Pointer to an IShellItem that specifies the item to be moved.
psiDestinationFolder : [comobj] Type: IShellItem* Pointer to an IShellItem that specifies the destination folder to contain the moved item.
pszNewName : [wstr] Type: LPCWSTR Pointer to a new name for the item in its new location. This is a null-terminated Unicode string and can be NULL. If NULL, the name of the destination item is the same as the source.
%inst
Performs caller-implemented actions before the move process for each
item begins.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise. In the case of an error value, the move operation and all
subsequent operations pending from the call to IFileOperation are
canceled.


%index
IFileOperationProgressSink_PostMoveItem
Performs caller-implemented actions after the move process for each item is complete.
%group
COM misc / IFileOperationProgressSink
%prm
this, dwFlags, psiItem, psiDestinationFolder, pszNewName, hrMove, psiNewlyCreated
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
dwFlags : [int] Type: DWORD bitwise value that contains flags that were used during the move operation. Some values can be set or changed during the move operation. See TRANSFER_SOURCE_FLAGS for flag descriptions.
psiItem : [comobj] Type: IShellItem* Pointer to an IShellItem that specifies the source item.
psiDestinationFolder : [comobj] Type: IShellItem* Pointer to an IShellItem that specifies the destination folder that contains the moved item.
pszNewName : [wstr] Type: LPCWSTR Pointer to the name that was given to the item after it was moved. This is a null-terminated Unicode string. Note that this might not be the name that you asked for, given collisions and other naming rules.
hrMove : [intptr] Type: HRESULT The return value of the move operation. Note that this is not the HRESULT returned by MoveItem, which simply queues the move operation. Instead, this is the result of the actual move.
psiNewlyCreated : [comobj] Type: IShellItem* Pointer to an IShellItem that represents the moved item in its new location.
%inst
Performs caller-implemented actions after the move process for each
item is complete.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise. In the case of an error value, all subsequent operations
pending from the call to IFileOperation are canceled.


%index
IFileOperationProgressSink_PreCopyItem
Performs caller-implemented actions before the copy process for each item begins.
%group
COM misc / IFileOperationProgressSink
%prm
this, dwFlags, psiItem, psiDestinationFolder, pszNewName
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
dwFlags : [int] Type: DWORD bitwise value that contains flags that control the operation. See TRANSFER_SOURCE_FLAGS for flag descriptions.
psiItem : [comobj] Type: IShellItem* Pointer to an IShellItem that specifies the source item.
psiDestinationFolder : [comobj] Type: IShellItem* Pointer to an IShellItem that specifies the destination folder to contain the copy of the item.
pszNewName : [wstr] Type: LPCWSTR Pointer to a new name for the item after it has been copied. This is a null-terminated Unicode string and can be NULL. If NULL, the name of the destination item is the same as the source.
%inst
Performs caller-implemented actions before the copy process for each
item begins.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise. In the case of an error value, the copy operation and all
subsequent operations pending from the call to IFileOperation are
canceled.


%index
IFileOperationProgressSink_PostCopyItem
Performs caller-implemented actions after the copy process for each item is complete.
%group
COM misc / IFileOperationProgressSink
%prm
this, dwFlags, psiItem, psiDestinationFolder, pszNewName, hrCopy, psiNewlyCreated
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
dwFlags : [int] Type: DWORD bitwise value that contains flags that were used during the copy operation. Some values can be set or changed during the copy operation. See TRANSFER_SOURCE_FLAGS for flag descriptions.
psiItem : [comobj] Type: IShellItem* Pointer to an IShellItem that specifies the source item.
psiDestinationFolder : [comobj] Type: IShellItem* Pointer to an IShellItem that specifies the destination folder to which the item was copied.
pszNewName : [wstr] Type: LPCWSTR Pointer to the new name that was given to the item after it was copied. This is a null-terminated Unicode string. Note that this might not be the name that you asked for, given collisions and other naming rules.
hrCopy : [intptr] Type: HRESULT The return value of the copy operation. Note that this is not the HRESULT returned by CopyItem, which simply queues the copy operation. Instead, this is the result of the actual copy.
psiNewlyCreated : [comobj] Type: IShellItem* Pointer to an IShellItem that represents the new copy of the item.
%inst
Performs caller-implemented actions after the copy process for each
item is complete.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise. In the case of an error value, all subsequent operations
pending from the call to IFileOperation are canceled.


%index
IFileOperationProgressSink_PreDeleteItem
Performs caller-implemented actions before the delete process for each item begins.
%group
COM misc / IFileOperationProgressSink
%prm
this, dwFlags, psiItem
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
dwFlags : [int] Type: DWORD bitwise value that contains flags that control the operation. See TRANSFER_SOURCE_FLAGS for flag descriptions.
psiItem : [comobj] Type: IShellItem* Pointer to an IShellItem that specifies the item to be deleted.
%inst
Performs caller-implemented actions before the delete process for
each item begins.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise. In the case of an error value, the delete operation and
all subsequent operations pending from the call to IFileOperation are
canceled.


%index
IFileOperationProgressSink_PostDeleteItem
Performs caller-implemented actions after the delete process for each item is complete.
%group
COM misc / IFileOperationProgressSink
%prm
this, dwFlags, psiItem, hrDelete, psiNewlyCreated
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
dwFlags : [int] Type: DWORD bitwise value that contains flags that were used during the delete operation. Some values can be set or changed during the delete operation. See TRANSFER_SOURCE_FLAGS for flag descriptions.
psiItem : [comobj] Type: IShellItem* Pointer to an IShellItem that specifies the item that was deleted.
hrDelete : [intptr] Type: HRESULT The return value of the delete operation. Note that this is not the HRESULT returned by DeleteItem, which simply queues the delete operation. Instead, this is the result of the actual deletion.
psiNewlyCreated : [comobj] Type: IShellItem* A pointer to an IShellItem that specifies the deleted item, now in the Recycle Bin. If the item was fully deleted, this value is NULL.
%inst
Performs caller-implemented actions after the delete process for each
item is complete.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise. In the case of an error value, all subsequent operations
pending from the call to IFileOperation are canceled.


%index
IFileOperationProgressSink_PreNewItem
Performs caller-implemented actions before the process to create a new item begins.
%group
COM misc / IFileOperationProgressSink
%prm
this, dwFlags, psiDestinationFolder, pszNewName
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
dwFlags : [int] Type: DWORD bitwise value that contains flags that control the operation. See TRANSFER_SOURCE_FLAGS for flag descriptions.
psiDestinationFolder : [comobj] Type: IShellItem* Pointer to an IShellItem that specifies the destination folder that will contain the new item.
pszNewName : [wstr] Type: LPCWSTR Pointer to the file name of the new item, for instance Newfile.txt. This is a null-terminated, Unicode string.
%inst
Performs caller-implemented actions before the process to create a
new item begins.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise. In the case of an error value, this operation and all
subsequent operations pending from the call to IFileOperation are
canceled.


%index
IFileOperationProgressSink_PostNewItem
Performs caller-implemented actions after the new item is created.
%group
COM misc / IFileOperationProgressSink
%prm
this, dwFlags, psiDestinationFolder, pszNewName, pszTemplateName, dwFileAttributes, hrNew, psiNewItem
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
dwFlags : [int] Type: DWORD bitwise value that contains flags that were used during the creation operation. Some values can be set or changed during the creation operation. See TRANSFER_SOURCE_FLAGS for flag descriptions.
psiDestinationFolder : [comobj] Type: IShellItem* Pointer to an IShellItem that specifies the destination folder to which the new item was added.
pszNewName : [wstr] Type: LPCWSTR Pointer to the file name of the new item, for instance Newfile.txt. This is a null-terminated, Unicode string.
pszTemplateName : [wstr] Type: LPCWSTR Pointer to the name of the template file (for example Excel9.xls) that the new item is based on, stored in one of the following locations:
dwFileAttributes : [int] Type: DWORD The file attributes applied to the new item. One or more of the values found at GetFileAttributes.
hrNew : [intptr] Type: HRESULT The return value of the creation operation. Note that this is not the HRESULT returned by NewItem, which simply queues the creation operation. Instead, this is the result of the actual creation.
psiNewItem : [comobj] Type: IShellItem* Pointer to an IShellItem that represents the new item.
%inst
Performs caller-implemented actions after the new item is created.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise. In the case of an error value, all subsequent operations
pending from the call to IFileOperation are canceled.


%index
IFileOperationProgressSink_UpdateProgress
Provides an estimate of the total amount of work currently done in relation to the total amount of work.
%group
COM misc / IFileOperationProgressSink
%prm
this, iWorkTotal, iWorkSoFar
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
iWorkTotal : [int] Type: UINT An estimate of the amount of work to be completed.
iWorkSoFar : [int] Type: UINT The portion of iWorkTotal that has been completed so far.
%inst
Provides an estimate of the total amount of work currently done in
relation to the total amount of work.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The iWorkTotal and iWorkSoFar values are "points" or estimates of the
amount of work to be done, and how much is completed. They are not
specified in any particular units, but should be roughly proportional
to how much time the total process takes. For example, to copy one
small file might be considered two points, and a large file might be
considered ten points. If a process is performing an operation that
copies five small files and one large file, and the process has
completed four of the small files, iWorkSoFar would be eight points
(4 x 2 = 8) and iWorkTotal would be twenty points (5 x 2 + 10 = 20),
so the estimate would be 8 of 20 points (or 40%) complete.


%index
IFileOperationProgressSink_ResetTimer
Not supported. (IFileOperationProgressSink.ResetTimer)
%group
COM misc / IFileOperationProgressSink
%prm
this
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
%inst
Not supported. (IFileOperationProgressSink.ResetTimer)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This method should return S_OK rather than E_NOTIMPL.


%index
IFileOperationProgressSink_PauseTimer
Not supported. (IFileOperationProgressSink.PauseTimer)
%group
COM misc / IFileOperationProgressSink
%prm
this
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
%inst
Not supported. (IFileOperationProgressSink.PauseTimer)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This method should return S_OK rather than E_NOTIMPL.


%index
IFileOperationProgressSink_ResumeTimer
Not supported. (IFileOperationProgressSink.ResumeTimer)
%group
COM misc / IFileOperationProgressSink
%prm
this
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
%inst
Not supported. (IFileOperationProgressSink.ResumeTimer)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This method should return S_OK rather than E_NOTIMPL.


%index
IFileSaveDialog_Show
IFileSaveDialog::Show (vtable slot 3)
%group
COM misc / IFileSaveDialog
%prm
this, hwndOwner
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
hwndOwner : [intptr] 
%inst


%index
IFileSaveDialog_SetFileTypes
IFileSaveDialog::SetFileTypes (vtable slot 4)
%group
COM misc / IFileSaveDialog
%prm
this, cFileTypes, rgFilterSpec
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
cFileTypes : [int] 
rgFilterSpec : [var] 
%inst


%index
IFileSaveDialog_SetFileTypeIndex
IFileSaveDialog::SetFileTypeIndex (vtable slot 5)
%group
COM misc / IFileSaveDialog
%prm
this, iFileType
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
iFileType : [int] 
%inst


%index
IFileSaveDialog_GetFileTypeIndex
IFileSaveDialog::GetFileTypeIndex (vtable slot 6)
%group
COM misc / IFileSaveDialog
%prm
this, piFileType
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
piFileType : [int] 
%inst


%index
IFileSaveDialog_Advise
IFileSaveDialog::Advise (vtable slot 7)
%group
COM misc / IFileSaveDialog
%prm
this, pfde, pdwCookie
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pfde : [comobj] 
pdwCookie : [int] 
%inst


%index
IFileSaveDialog_Unadvise
IFileSaveDialog::Unadvise (vtable slot 8)
%group
COM misc / IFileSaveDialog
%prm
this, dwCookie
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
dwCookie : [int] 
%inst


%index
IFileSaveDialog_SetOptions
IFileSaveDialog::SetOptions (vtable slot 9)
%group
COM misc / IFileSaveDialog
%prm
this, fos
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
fos : [int] 
%inst


%index
IFileSaveDialog_GetOptions
IFileSaveDialog::GetOptions (vtable slot 10)
%group
COM misc / IFileSaveDialog
%prm
this, pfos
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pfos : [var] 
%inst


%index
IFileSaveDialog_SetDefaultFolder
IFileSaveDialog::SetDefaultFolder (vtable slot 11)
%group
COM misc / IFileSaveDialog
%prm
this, psi
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
psi : [comobj] 
%inst


%index
IFileSaveDialog_SetFolder
IFileSaveDialog::SetFolder (vtable slot 12)
%group
COM misc / IFileSaveDialog
%prm
this, psi
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
psi : [comobj] 
%inst


%index
IFileSaveDialog_GetFolder
IFileSaveDialog::GetFolder (vtable slot 13)
%group
COM misc / IFileSaveDialog
%prm
this, ppsi
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] 
%inst


%index
IFileSaveDialog_GetCurrentSelection
IFileSaveDialog::GetCurrentSelection (vtable slot 14)
%group
COM misc / IFileSaveDialog
%prm
this, ppsi
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] 
%inst


%index
IFileSaveDialog_SetFileName
IFileSaveDialog::SetFileName (vtable slot 15)
%group
COM misc / IFileSaveDialog
%prm
this, pszName
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pszName : [wstr] 
%inst


%index
IFileSaveDialog_GetFileName
IFileSaveDialog::GetFileName (vtable slot 16)
%group
COM misc / IFileSaveDialog
%prm
this, pszName
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pszName : [var] 
%inst


%index
IFileSaveDialog_SetTitle
IFileSaveDialog::SetTitle (vtable slot 17)
%group
COM misc / IFileSaveDialog
%prm
this, pszTitle
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pszTitle : [wstr] 
%inst


%index
IFileSaveDialog_SetOkButtonLabel
IFileSaveDialog::SetOkButtonLabel (vtable slot 18)
%group
COM misc / IFileSaveDialog
%prm
this, pszText
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pszText : [wstr] 
%inst


%index
IFileSaveDialog_SetFileNameLabel
IFileSaveDialog::SetFileNameLabel (vtable slot 19)
%group
COM misc / IFileSaveDialog
%prm
this, pszLabel
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pszLabel : [wstr] 
%inst


%index
IFileSaveDialog_GetResult
IFileSaveDialog::GetResult (vtable slot 20)
%group
COM misc / IFileSaveDialog
%prm
this, ppsi
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] 
%inst


%index
IFileSaveDialog_AddPlace
IFileSaveDialog::AddPlace (vtable slot 21)
%group
COM misc / IFileSaveDialog
%prm
this, psi, fdap
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
psi : [comobj] 
fdap : [int] 
%inst


%index
IFileSaveDialog_SetDefaultExtension
IFileSaveDialog::SetDefaultExtension (vtable slot 22)
%group
COM misc / IFileSaveDialog
%prm
this, pszDefaultExtension
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pszDefaultExtension : [wstr] 
%inst


%index
IFileSaveDialog_Close
IFileSaveDialog::Close (vtable slot 23)
%group
COM misc / IFileSaveDialog
%prm
this, hr
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
hr : [intptr] 
%inst


%index
IFileSaveDialog_SetClientGuid
IFileSaveDialog::SetClientGuid (vtable slot 24)
%group
COM misc / IFileSaveDialog
%prm
this, guid
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
guid : [var] 
%inst


%index
IFileSaveDialog_ClearClientData
IFileSaveDialog::ClearClientData (vtable slot 25)
%group
COM misc / IFileSaveDialog
%prm
this
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
%inst


%index
IFileSaveDialog_SetFilter
IFileSaveDialog::SetFilter (vtable slot 26)
%group
COM misc / IFileSaveDialog
%prm
this, pFilter
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pFilter : [comobj] 
%inst


%index
IFileSaveDialog_SetSaveAsItem
Sets an item to be used as the initial entry in a Save As dialog.
%group
COM misc / IFileSaveDialog
%prm
this, psi
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
psi : [comobj] Type: IShellItem* Pointer to an IShellItem that represents the item.
%inst
Sets an item to be used as the initial entry in a Save As dialog.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The name of the item is displayed in the file name edit box, and the
containing folder is opened in the view. This would generally be used
when the application is saving an item that already exists. For new
items, use IFileDialog::SetFileName.


%index
IFileSaveDialog_SetProperties
Provides a property store that defines the default values to be used for the item being saved.
%group
COM misc / IFileSaveDialog
%prm
this, pStore
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pStore : [comobj] Type: IPropertyStore* Pointer to the interface that represents the property store that contains the associated metadata.
%inst
Provides a property store that defines the default values to be used
for the item being saved.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This method can be called at any time before the dialog is opened or
while the dialog is showing. If an item has inherent properties, this
method should be called with those properties before showing the
dialog. When using Save As, the application should provide the
properties of the item being saved to the Save dialog. Those
properties should be retreived from the original item by calling
GetPropertyStore with the GPS_HANDLERPROPERTIESONLY flag. To retrieve
the properties of the saved item (which may have been modified by the
user) after the dialog closes, call IFileSaveDialog::GetProperties.
To turn on property collection and indicate which properties should
be displayed in the Save dialog, use
IFileSaveDialog::SetCollectedProperties.


%index
IFileSaveDialog_SetCollectedProperties
Specifies which properties will be collected in the save dialog.
%group
COM misc / IFileSaveDialog
%prm
this, pList, fAppendDefault
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pList : [comobj] Type: IPropertyDescriptionList* Pointer to the interface that represents the list of properties to collect. This parameter can be NULL.
fAppendDefault : [int] Type: BOOL TRUE to show default properties for the currently selected filetype in addition to the properties specified by pList. FALSE to show only properties specified by pList.
%inst
Specifies which properties will be collected in the save dialog.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The calling application can use the
PSGetPropertyDescriptionListFromString function to construct an
IPropertyDescriptionList from a string such as
"prop:Comments;Subject;". For more information about property
schemas, see Property Schemas.
IFileSaveDialog::SetCollectedProperties can be called at any time
before the dialog is displayed or while it is visible. If different
properties are to be collected depending on the chosen filetype, then
IFileSaveDialog::SetCollectedProperties can be called in response to
OnTypeChange. Note By default, no properties are collected in the
save dialog.


%index
IFileSaveDialog_GetProperties
Retrieves the set of property values for a saved item or an item in the process of being saved.
%group
COM misc / IFileSaveDialog
%prm
this, ppStore
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
ppStore : [comobj] Type: IPropertyStore** Address of a pointer to an IPropertyStore that receives the property values.
%inst
Retrieves the set of property values for a saved item or an item in
the process of being saved.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This method can be called while the dialog is showing to retrieve the
current set of values in the metadata collection pane. It can also be
called after the dialog has closed, to retrieve the final set of
values. The call to this method will fail unless property collection
has been turned on with a call to
IFileSaveDialog::SetCollectedProperties.


%index
IFileSaveDialog_ApplyProperties
Applies a set of properties to an item using the Shell's copy engine.
%group
COM misc / IFileSaveDialog
%prm
this, psi, pStore, hwnd, pSink
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
psi : [comobj] Type: IShellItem* Pointer to the IShellItem that represents the file being saved. This is usually the item retrieved by GetResult.
pStore : [comobj] Type: IPropertyStore* Pointer to the IPropertyStore that represents the property values to be applied to the file. This can be the property store returned by IFileSaveDialog::GetProperties.
hwnd : [intptr] Type: HWND The handle of the application window.
pSink : [comobj] Type: IFileOperationProgressSink* Pointer to an optional IFileOperationProgressSink that the calling application can use if they want to be notified of the progress of the property stamping. This value may be NULL.
%inst
Applies a set of properties to an item using the Shell's copy engine.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This method should be used when the application has turned on
property collection (IFileSaveDialog::SetCollectedProperties), but
does not persist the properties themselves into the saved file. Note
The file represented by the item specified in psi must exist in
physical storage before making the call to
IFileSaveDialog::ApplyProperties, so it must have been previously
saved at some point.


%index
IModalWindow_Show
Launches the modal window.
%group
COM misc / IModalWindow
%prm
this, hwndOwner
this : [comobj] IModalWindow インターフェースの COM オブジェクト変数
hwndOwner : [intptr] Type: HWND The handle of the owner window. This value can be NULL.
%inst
Launches the modal window.

[戻り値]
Type: HRESULT If the method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code, including the following:
This doc was truncated.


%index
IMoniker_GetClassID
IMoniker::GetClassID (vtable slot 3)
%group
COM misc / IMoniker
%prm
this, pClassID
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pClassID : [var] 
%inst


%index
IMoniker_IsDirty
IMoniker::IsDirty (vtable slot 4)
%group
COM misc / IMoniker
%prm
this
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
%inst


%index
IMoniker_Load
IMoniker::Load (vtable slot 5)
%group
COM misc / IMoniker
%prm
this, pStm
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pStm : [comobj] 
%inst


%index
IMoniker_Save
IMoniker::Save (vtable slot 6)
%group
COM misc / IMoniker
%prm
this, pStm, fClearDirty
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pStm : [comobj] 
fClearDirty : [int] 
%inst


%index
IMoniker_GetSizeMax
IMoniker::GetSizeMax (vtable slot 7)
%group
COM misc / IMoniker
%prm
this, pcbSize
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pcbSize : [int64] 
%inst


%index
IMoniker_BindToObject
Binds to the specified object. The binding process involves finding the object, putting it into the running state if necessary, and providing the caller with a pointer to a specified interface on the identified object.
%group
COM misc / IMoniker
%prm
this, pbc, pmkToLeft, riidResult, ppvResult
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pbc : [comobj] A pointer to the IBindCtx interface on the bind context object, which is used in this binding operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the moniker implementation should retrieve information about its environment.
pmkToLeft : [comobj] If the moniker is part of a composite moniker, pointer to the moniker to the left of this moniker. This parameter is primarily used by moniker implementers to enable cooperation between the various components of a composite moniker. Moniker clients should use NULL.
riidResult : [var] The IID of the interface the client wishes to use to communicate with the object that the moniker identifies.
ppvResult : [int] The address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvResult contains the requested interface pointer to the object the moniker identifies. When successful, the implementation must call AddRef on the moniker. It is the caller's responsibility to call Release. If an error occurs, *ppvResult should be NULL.
%inst
Binds to the specified object. The binding process involves finding
the object, putting it into the running state if necessary, and
providing the caller with a pointer to a specified interface on the
identified object.

[戻り値]
This method can return the standard return values E_OUTOFMEMORY and
E_UNEXPECTED, as well as the following values.
This doc was truncated.

[備考]
BindToObject implements the primary function of a moniker, which is
to locate the object identified by the moniker and return a pointer
to one of its interfaces. Notes to Callers If you are using a moniker
as a persistent connection between two objects, you activate the
connection by calling BindToObject. You typically call BindToObject
during the following process:
This doc was truncated.


%index
IMoniker_BindToStorage
Binds to the storage for the specified object. Unlike the IMoniker::BindToObject method, this method does not activate the object identified by the moniker.
%group
COM misc / IMoniker
%prm
this, pbc, pmkToLeft, riid, ppvObj
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pbc : [comobj] A pointer to the IBindCtx interface on the bind context object, which is used in this binding operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the moniker implementation should retrieve information about its environment.
pmkToLeft : [comobj] If the moniker is part of a composite moniker, pointer to the moniker to the left of this moniker. This parameter is primarily used by moniker implementers to enable cooperation between the various components of a composite moniker. Moniker clients should use NULL.
riid : [var] A reference to the identifier of the storage interface requested, whose pointer will be returned in ppvObj. Storage interfaces commonly requested include IStorage, IStream, and ILockBytes.
ppvObj : [int] The address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvObj contains the requested interface pointer to the storage of the object the moniker identifies. When successful, the implementation must call AddRef on the storage. It is the caller's responsibility to call Release. If an error occurs, *ppvObj should be NULL.
%inst
Binds to the storage for the specified object. Unlike the
IMoniker::BindToObject method, this method does not activate the
object identified by the moniker.

[戻り値]
This method can return the standard return values E_UNEXPECTED, as
well as the following values.
This doc was truncated.

[備考]
There is an important difference between the BindToObject and
BindToStorage methods. If, for example, you have a moniker that
identifies a spreadsheet object, calling BindToObject provides access
to the spreadsheet object itself, while calling BindToStorage
provides access to the storage object in which the spreadsheet
resides. Notes to Callers Although none of the COM moniker classes
call this method in their binding operations, it might be appropriate
to call it in the implementation of a new moniker class. You could
call this method in an implementation of BindToObject that requires
information from the object identified by the pmkToLeft parameter and
can get it from the persistent storage of the object without
activation. For example, if your monikers are used to identify
objects that can be activated without activating their containers,
you may find this method useful. A client that can read the storage
of the object its moniker identifies could also call this method.
Notes to Implementers Your implementation should locate the
persistent storage for the object identified by the current moniker
and return the desired interface pointer. Some types of monikers
represent pseudo-objects, which are objects that do not have their
own persistent storage. Such objects comprise some portion of the
internal state of its container, for example, a range of cells in a
spreadsheet. If your moniker class identifies this type of object,
your implementation of BindToStorage should return the error
MK_E_NOSTORAGE. If the bind context's BIND_OPTS structure specifies
the BINDFLAGS_JUSTTESTEXISTENCE flag, your implementation has the
option of returning NULL in ppvObj (although you can also ignore the
flag and perform the complete binding operation).
Implementation-specific Notes
This doc was truncated.


%index
IMoniker_Reduce
Reduces a moniker to its simplest form.
%group
COM misc / IMoniker
%prm
this, pbc, dwReduceHowFar, ppmkToLeft, ppmkReduced
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pbc : [comobj] A pointer to the IBindCtx interface on the bind context to be used in this binding operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the moniker implementation should retrieve information about its environment.
dwReduceHowFar : [int] Specifies how far this moniker should be reduced. This parameter must be one of the values from the MKRREDUCE enumeration.
ppmkToLeft : [comobj] On entry, a pointer to an IMoniker pointer variable that contains the interface pointer to moniker to the left of this moniker. This parameter is used primarily by moniker implementers to enable cooperation between the various components of a composite moniker; moniker clients can usually pass NULL. On return, *ppmkToLeft is usually set to NULL, indicating no change in the original moniker to the left. In rare situations, *ppmkToLeft indicates a moniker, indicating that the previous moniker to the left should be disregarded and the moniker returned through *ppmkToLeft is the replacement. In such a situation, the implementation must call Release on the old moniker to the left of this moniker and must call AddRef on the new returned moniker; the caller must release it later. If an error occurs, the implementation can either leave the interface pointer unchanged or set it to NULL.
ppmkReduced : [comobj] A pointer to an IMoniker pointer variable that receives the interface pointer to the reduced form of this moniker, which can be NULL if an error occurs or if this moniker is reduced to nothing. If this moniker cannot be reduced, *ppmkReduced is simply set to this moniker and the return value is MK_S_REDUCED_TO_SELF. If *ppmkReduced is non-NULL, the implementation must call AddRef on the new moniker; it is the caller's responsibility to call Release. (This is true even if *ppmkReduced is set to this moniker.)
%inst
Reduces a moniker to its simplest form.

[戻り値]
This method can return the standard return values E_OUTOFMEMORY and
E_UNEXPECTED, as well as the following values.
This doc was truncated.

[備考]
This method is intended for the following uses:
This doc was truncated.


%index
IMoniker_ComposeWith
Creates a new composite moniker by combining the current moniker with the specified moniker.
%group
COM misc / IMoniker
%prm
this, pmkRight, fOnlyIfNotGeneric, ppmkComposite
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pmkRight : [comobj] A pointer to the IMoniker interface on the moniker to compose onto the end of this moniker.
fOnlyIfNotGeneric : [int] If TRUE, the caller requires a nongeneric composition, so the operation should proceed only if pmkRight is a moniker class that this moniker can compose with in some way other than forming a generic composite. If FALSE, the method can create a generic composite if necessary. Most callers should set this parameter to FALSE.
ppmkComposite : [comobj] A pointer to an IMoniker pointer variable that receives the composite moniker pointer. When successful, the implementation must call AddRef on the resulting moniker; it is the caller's responsibility to call Release. If an error occurs or if the monikers compose to nothing (for example, composing an anti-moniker with an item moniker or a file moniker), *ppmkComposite should be set to NULL.
%inst
Creates a new composite moniker by combining the current moniker with
the specified moniker.

[戻り値]
This method can return the standard return values E_OUTOFMEMORY and
E_UNEXPECTED, as well as the following values.
This doc was truncated.

[備考]
Joining two monikers together is called composition. Sometimes two
monikers of the same class can be combined in what is called
nongeneric composition. For example, a file moniker representing an
incomplete path and another file moniker representing a relative path
can be combined to form a single file moniker representing the
complete path. Nongeneric composition for a given moniker class can
be handled only in the implementation of ComposeWith for that moniker
class. Combining two monikers of any class is called generic
composition, which can be accomplished through a call to the
CreateGenericComposite function. Composition of monikers is an
associative operation. That is, if A, B, and C are monikers, then,
where Comp() represents the composition operation, Comp( Comp( A, B
), C ) is always equal to Comp( A, Comp( B, C ) ). Notes to Callers
To combine two monikers, you should call ComposeWith rather than
calling the CreateGenericComposite function to give the first moniker
a chance to perform a nongeneric composition. An object that provides
item monikers to identify its objects would call ComposeWith to
provide a moniker that completely identifies the location of the
object. This would apply, for example, to a server that supports
linking to portions of a document, or to a container that supports
linking to embedded objects within its documents. In such a
situation, you would do the following:
This doc was truncated.


%index
IMoniker_Enum
Retrieves a pointer to an enumerator for the components of a composite moniker.
%group
COM misc / IMoniker
%prm
this, fForward, ppenumMoniker
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
fForward : [int] If TRUE, enumerates the monikers from left to right. If FALSE, enumerates from right to left.
ppenumMoniker : [comobj] A pointer to an IEnumMoniker pointer variable that receives the interface pointer to the enumerator object for the moniker. When successful, the implementation must call AddRef on the enumerator object. It is the caller's responsibility to call Release. If an error occurs or if the moniker has no enumerable components, the implementation sets *ppenumMoniker to NULL.
%inst
Retrieves a pointer to an enumerator for the components of a
composite moniker.

[戻り値]
This method can return the standard return values E_OUTOFMEMORY,
E_UNEXPECTED, and S_OK.

[備考]
This method must supply an IEnumMoniker pointer to an enumerator that
can enumerate the components of a moniker. For example, the
implementation of the IMoniker::Enum method for a generic composite
moniker creates an enumerator that can determine the individual
monikers that make up the composite, while the IMoniker::Enum method
for a file moniker creates an enumerator that returns monikers
representing each of the components in the path. Notes to Callers
Call this method to examine the components that make up a composite
moniker. Notes to Implementers If the new moniker class has no
discernible internal structure, your implementation of this method
can simply return S_OK and set ppenumMoniker to NULL.
Implementation-specific Notes
This doc was truncated.


%index
IMoniker_IsEqual
Determines whether this moniker is identical to the specified moniker.
%group
COM misc / IMoniker
%prm
this, pmkOtherMoniker
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pmkOtherMoniker : [comobj] A  pointer to the IMoniker interface on the moniker to be used for comparison with this one (the one from which this method is called).
%inst
Determines whether this moniker is identical to the specified
moniker.

[戻り値]
This method returns S_OK to indicate that the two monikers are
identical, and S_FALSE otherwise.

[備考]
Previous implementations of the running object table (ROT) called
this method. The current implementation of the ROT uses the IROTData
interface instead. Notes to Callers Call this method to determine
whether two monikers are identical. The reduced form of a moniker is
considered different from the unreduced form. You should call the
IMoniker::Reduce method before calling IsEqual, because a reduced
moniker is in its most specific form. IsEqual may return S_FALSE on
two monikers before they are reduced, and S_OK after they are
reduced. Notes to Implementers Your implementation should not reduce
the current moniker before performing the comparison. It is the
caller's responsibility to call IMoniker::Reduce to compare reduced
monikers. Two monikers that compare as equal must hash to the same
value using IMoniker::Hash. Implementation-specific Notes
This doc was truncated.


%index
IMoniker_Hash
Creates a hash value using the internal state of the moniker.
%group
COM misc / IMoniker
%prm
this, pdwHash
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pdwHash : [int] A pointer to a variable that receives the hash value.
%inst
Creates a hash value using the internal state of the moniker.

[戻り値]
This method returns S_OK to indicate that the hash value was
retrieved successfully.

[備考]
Notes to Callers You can use the value returned by this method to
maintain a hash table of monikers. The hash value determines a hash
bucket in the table. To search such a table for a specified moniker,
calculate its hash value and then compare it to the monikers in that
hash bucket using IMoniker::IsEqual. Notes to Implementers The hash
value must be constant for the lifetime of the moniker. Two monikers
that compare as equal using IMoniker::IsEqual must hash to the same
value. Marshaling and then unmarshaling a moniker should have no
effect on its hash value. Consequently, your implementation of
IMoniker::Hash should rely only on the internal state of the moniker,
not on its memory address. Implementation-specific Notes
This doc was truncated.


%index
IMoniker_IsRunning
Determines whether the object identified by this moniker is currently loaded and running.
%group
COM misc / IMoniker
%prm
this, pbc, pmkToLeft, pmkNewlyRunning
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pbc : [comobj] A pointer to the IBindCtx interface on the bind context to be used in this binding operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the moniker implementation should retrieve information about its environment.
pmkToLeft : [comobj] A pointer to the IMoniker interface on the moniker to the left of this moniker if this moniker is part of a composite. This parameter is used primarily by moniker implementers to enable cooperation between the various components of a composite moniker; moniker clients can usually pass NULL.
pmkNewlyRunning : [comobj] A pointer to the IMoniker interface on the moniker most recently added to the running object table (ROT). This can be NULL. If non-NULL, the implementation can return the results of calling IMoniker::IsEqual on the pmkNewlyRunning parameter, passing the current moniker. This parameter is intended to enable IsRunning implementations that are more efficient than just searching the ROT, but the implementation can choose to ignore pmkNewlyRunning without causing any harm.
%inst
Determines whether the object identified by this moniker is currently
loaded and running.

[戻り値]
This method can return the standard return values E_UNEXPECTED, as
well as the following values.
This doc was truncated.

[備考]
Notes to Callers If speed is important when you're requesting
services from the object identified by the moniker, you may want
those services only if the object is already running (because loading
an object into the running state may be time-consuming). In such a
situation, you should call IsRunning to determine whether the object
is running. For the monikers stored within linked objects, IsRunning
is primarily called by the default handler's implementation of
IOleLink::BindIfRunning. Notes to Implementers To get a pointer to
the ROT, your implementation should call
IBindCtx::GetRunningObjectTable on the pbc parameter. Your
implementation can then call IRunningObjectTable::IsRunning to
determine whether the object identified by the moniker is running.
The object identified by the moniker must have registered itself with
the ROT when it first began running. Implementation-specific Notes
This doc was truncated.


%index
IMoniker_GetTimeOfLastChange
Retrieves the time at which the object identified by this moniker was last changed.
%group
COM misc / IMoniker
%prm
this, pbc, pmkToLeft, pFileTime
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pbc : [comobj] A pointer to the bind context to be used in this binding operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the moniker implementation should retrieve information about its environment. For more information, see IBindCtx.
pmkToLeft : [comobj] If the moniker is part of a composite moniker, pointer to the moniker to the left of this moniker. This parameter is primarily used by moniker implementers to enable cooperation between the various components of a composite moniker. Moniker clients should pass NULL.
pFileTime : [var] A pointer to the FILETIME structure that receives the time of last change. A value of {0xFFFFFFFF,0x7FFFFFFF} indicates an error (for example, exceeded time limit, information not available).
%inst
Retrieves the time at which the object identified by this moniker was
last changed.

[戻り値]
This method can return the standard return values E_OUTOFMEMORY, as
well as the following values.
This doc was truncated.

[備考]
To be precise, the time returned is the earliest time COM can
identify after which no change has occurred, so this time may be
later than the time of the last change to the object. Notes to
Callers If you're caching information returned by the object
identified by the moniker, you may want to ensure that your
information is up-to-date. To do so, you would call
GetTimeOfLastChange and compare the time returned with the time you
last retrieved information from the object.
For the monikers stored within linked objects, GetTimeOfLastChange is
primarily called by the default handler's implementation of
IOleObject::IsUpToDate. Container applications call
IOleObject::IsUpToDate to determine if a linked object (or an
embedded object containing linked objects) is up-to-date without
actually binding to the object. This enables an application to
determine quickly which linked objects require updating when the end
user opens a document. The application can then bind only those
linked objects that need updating (after prompting the end user to
determine whether they should be updated) instead of binding every
linked object in the document. Notes to Implementers It is important
to perform this operation quickly because, for linked objects, this
method is called when a user first opens a compound document.
Consequently, your GetTimeOfLastChange implementation should not bind
to any objects. In addition, your implementation should check the
deadline parameter in the bind context and return
MK_E_EXCEEDEDDEADLINE if the operation cannot be completed by the
specified time. Following are some strategies you can use in your
implementations:
This doc was truncated.


%index
IMoniker_Inverse
Creates a moniker that is the inverse of this moniker. When composed to the right of this moniker or one of similar structure, the moniker will compose to nothing.
%group
COM misc / IMoniker
%prm
this, ppmk
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
ppmk : [comobj] The address of an IMoniker pointer variable that receives the interface pointer to a moniker that is the inverse of this moniker. When successful, the implementation must call AddRef on the new inverse moniker. It is the caller's responsibility to call Release. If an error occurs, the implementation should set *ppmk to NULL.
%inst
Creates a moniker that is the inverse of this moniker. When composed
to the right of this moniker or one of similar structure, the moniker
will compose to nothing.

[戻り値]
This method can return the standard return values E_OUTOFMEMORY, as
well as the following values.
This doc was truncated.

[備考]
The inverse of a moniker is analogous to the ".." directory in MS-DOS
file systems; the ".." directory acts as the inverse to any other
directory name, because appending ".." to a directory name results in
an empty path. In the same way, the inverse of a moniker typically is
also the inverse of all monikers in the same class. However, it is
not necessarily the inverse of a moniker of a different class. The
inverse of a composite moniker is a composite consisting of the
inverses of the components of the original moniker, arranged in
reverse order. For example, if the inverse of A is Inv( A ) and the
composite of A, B, and C is Comp( A, B, C ), then Inv( Comp( A, B, C
) ) is equal to Comp( Inv( C ), Inv( B ), Inv( A ) ). Not all
monikers have inverses. Most monikers that are themselves inverses,
such as anti-monikers, do not have inverses. Monikers that have no
inverse cannot have relative monikers formed from inside the objects
they identify to other objects outside. Notes to Callers An object
that is using a moniker to locate another object usually does not
know the class of the moniker it is using. To get the inverse of a
moniker, you should always call IMoniker::Inverse rather than the
CreateAntiMoniker function, because you cannot be certain that the
moniker you're using considers an anti-moniker to be its inverse.
The Inverse method is also called by the implementation of the
IMoniker::RelativePathTo method, to assist in constructing a relative
moniker. Notes to Implementers If your monikers have no internal
structure, you can call the CreateAntiMoniker function in to get an
anti-moniker in your implementation of IMoniker::Inverse. In your
implementation of IMoniker::ComposeWith, you need to check for the
inverse you supply in the implementation of Inverse.
Implementation-specific Notes
This doc was truncated.


%index
IMoniker_CommonPrefixWith
Creates a new moniker based on the prefix that this moniker has in common with the specified moniker.
%group
COM misc / IMoniker
%prm
this, pmkOther, ppmkPrefix
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pmkOther : [comobj] A pointer to the IMoniker interface on another moniker to be compared with this one to determine whether there is a common prefix.
ppmkPrefix : [comobj] The address of an IMoniker* pointer variable that receives the interface pointer to the moniker that is the common prefix of this moniker and pmkOther. When successful, the implementation must call AddRef on the resulting moniker; it is the caller's responsibility to call Release. If an error occurs or if there is no common prefix, the implementation should set *ppmkPrefix to NULL.
%inst
Creates a new moniker based on the prefix that this moniker has in
common with the specified moniker.

[戻り値]
This method can return the standard return values E_OUTOFMEMORY, as
well as the following values.
This doc was truncated.

[備考]
CommonPrefixWith creates a new moniker that consists of the common
prefixes of the moniker on this moniker object and another moniker.
For example, if one moniker represents the path
"c:\projects\secret\art\pict1.bmp" and another moniker represents the
path "c:\projects\secret\docs\chap1.txt", the common prefix of these
two monikers would be a moniker representing the path
"c:\projects\secret". Notes to Callers The CommonPrefixWith method is
primarily called in the implementation of the
IMoniker::RelativePathTo method. Clients using a moniker to locate an
object rarely need to call this method.
Call this method only if pmkOther and this moniker are both absolute
monikers. An absolute moniker is either a file moniker or a generic
composite whose leftmost component is a file moniker that represents
an absolute path. Do not call this method on relative monikers
because it would not produce meaningful results.
Notes to Implementers Your implementation should first determine
whether pmkOther is a moniker of a class that you recognize and for
which you can provide special handling (for example, if it is of the
same class as this moniker). If so, your implementation should
determine the common prefix of the two monikers. Otherwise, it should
pass both monikers in a call to the MonikerCommonPrefixWith function,
which correctly handles the generic case.
Implementation-specific Notes
This doc was truncated.


%index
IMoniker_RelativePathTo
Creates a relative moniker between this moniker and the specified moniker.
%group
COM misc / IMoniker
%prm
this, pmkOther, ppmkRelPath
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pmkOther : [comobj] A pointer to the IMoniker interface on the moniker to which a relative path should be taken.
ppmkRelPath : [comobj] A pointer to an  IMoniker pointer variable that receives the interface pointer to the relative moniker. When successful, the implementation must call AddRef on the new moniker; it is the caller's responsibility to call Release. If an error occurs, the implementation sets *ppmkRelPath to NULL.
%inst
Creates a relative moniker between this moniker and the specified
moniker.

[戻り値]
This method can return the standard return values E_OUTOFMEMORY and
E_UNEXPECTED, as well as the following values.
This doc was truncated.

[備考]
A relative moniker is analogous to a relative path (such as
"..\backup"). For example, suppose you have one moniker that
represents the path "c:\projects\secret\art\pict1.bmp" and another
moniker that represents the path "c:\projects\secret\docs\chap1.txt".
Calling RelativePathTo on the first moniker, passing the second one
as the pmkOther parameter, would create a relative moniker
representing the path "..\docs\chap1.txt". Notes to Callers Moniker
clients typically do not need to call RelativePathTo. This method is
called primarily by the default handler for linked objects. Linked
objects contain both an absolute and a relative moniker to identify
the link source. (This enables link tracking if the user moves a
directory tree containing both the container and source files.) The
default handler calls this method to create a relative moniker from
the container document to the link source. (That is, it calls
RelativePathTo on the moniker identifying the container document,
passing the moniker identifying the link source as the pmkOther
parameter.) If you do call RelativePathTo, call it only on absolute
monikers, for example, a file moniker or a composite moniker whose
leftmost component is a file moniker, where the file moniker
represents an absolute path. Do not call this method on relative
monikers. Notes to Implementers Your implementation of RelativePathTo
should first determine whether pmkOther is a moniker of a class that
you recognize and for which you can provide special handling (for
example, if it is of the same class as this moniker). If so, your
implementation should determine the relative path. Otherwise, it
should pass both monikers in a call to the MonikerRelativePathTo
function, which correctly handles the generic case. The first step in
determining a relative path is determining the common prefix of this
moniker and pmkOther. The next step is to break this moniker and
pmkOther into two parts each, say (P, myTail) and (P, otherTail)
respectively, where P is the common prefix. The correct relative path
is then the inverse of myTail composed with otherTail: Comp( Inv(
myTail ), otherTail ) where Comp() represents the composition
operation and Inv() represents the inverse operation. For certain
types of monikers, you cannot use your IMoniker::Inverse method to
construct the inverse of myTail. For example, a file moniker returns
an anti-moniker as an inverse, while its RelativePathTo method must
use one or more file monikers that each represent the path ".." to
construct the inverse of myTail. Implementation-specific Notes
This doc was truncated.


%index
IMoniker_GetDisplayName
Retrieves the display name for the moniker.
%group
COM misc / IMoniker
%prm
this, pbc, pmkToLeft, ppszDisplayName
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pbc : [comobj] A pointer to the IBindCtx interface on the bind context to be used in this operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the moniker implementation should retrieve information about its environment.
pmkToLeft : [comobj] If the moniker is part of a composite moniker, pointer to the moniker to the left of this moniker. This parameter is used primarily by moniker implementers to enable cooperation between the various components of a composite moniker. Moniker clients should pass NULL.
ppszDisplayName : [var] The address of a pointer variable that receives a pointer to the display name string for the moniker. The implementation must use IMalloc::Alloc to allocate the string returned in ppszDisplayName, and the caller is responsible for calling IMalloc::Free to free it. Both the caller and the implementation of this method use the COM task allocator returned by CoGetMalloc. If an error occurs, the implementation must set *ppszDisplayName should be set to NULL.
%inst
Retrieves the display name for the moniker.

[戻り値]
This method can return the standard return values E_OUTOFMEMORY, as
well as the following values.
This doc was truncated.

[備考]
GetDisplayName provides a string that is a displayable representation
of the moniker. A display name is not a complete representation of a
moniker's internal state; it is simply a form that can be read by
users. As a result, it is possible (though rare) for two different
monikers to have the same display name. While there is no guarantee
that the display name of a moniker can be parsed back into that
moniker when calling the MkParseDisplayName function with it, failure
to do so is rare. Notes to Callers It is possible that retrieving a
moniker's display name may be an expensive operation. For efficiency,
you may want to cache the results of the first successful call to
GetDisplayName, rather than making repeated calls. Notes to
Implementers If you are writing a moniker class in which the display
name does not change, simply cache the display name and supply the
cached name when requested. If the display name can change over time,
getting the current display name might mean that the moniker has to
access the object's storage or bind to the object, either of which
can be expensive operations. If this is the case, your implementation
of GetDisplayName should return MK_E_EXCEEDEDDEADLINE if the name
cannot be retrieved by the time specified in the bind context's
BIND_OPTS structure. A moniker that is intended to be part of a
generic composite moniker should include any preceding delimiter
(such as '\') as part of its display name. For example, the display
name returned by an item moniker includes the delimiter specified
when it was created with the CreateItemMoniker function. The display
name for a file moniker does not include a delimiter because file
monikers are always expected to be the leftmost component of a
composite. Implementation-specific Notes
This doc was truncated.


%index
IMoniker_ParseDisplayName
Converts a display name into a moniker.
%group
COM misc / IMoniker
%prm
this, pbc, pmkToLeft, pszDisplayName, pchEaten, ppmkOut
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pbc : [comobj] A pointer to the IBindCtx interface on the bind context to be used in this binding operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the moniker implementation should retrieve information about its environment.
pmkToLeft : [comobj] A pointer to the IMoniker interface on the moniker that has been built out of the display name up to this point.
pszDisplayName : [wstr] The remaining display name to be parsed.
pchEaten : [int] A pointer to a variable that receives the number of characters in pszDisplayName that were consumed in this step.
ppmkOut : [comobj] A pointer to an IMoniker pointer variable that receives the interface pointer to the moniker that was built from pszDisplayName. When successful, the implementation must call AddRef on the new moniker; it is the caller's responsibility to call Release. If an error occurs, the implementation sets *ppmkOut to NULL.
%inst
Converts a display name into a moniker.

[戻り値]
This method can return the standard return valuesE_OUTOFMEMORY and
E_UNEXPECTED, as well as the following values.
This doc was truncated.

[備考]
Notes to Callers Moniker clients do not typically call
ParseDisplayName directly. Instead, they call the MkParseDisplayName
function when they want to convert a display name into a moniker (for
example, in implementing the Links dialog box for a container
application, or for implementing a macro language that supports
references to objects outside the document). That function first
parses the initial portion of the display name itself. It then calls
ParseDisplayName on the moniker it has just created, passing the
remainder of the display name and getting a new moniker in return;
this step is repeated until the entire display name has been parsed.
Notes to Implementers Your implementation may be able to perform this
parsing by itself if your moniker class is designed to designate only
certain kinds of objects. Otherwise, you must get an
IParseDisplayName interface pointer for the object identified by the
moniker-so-far (that is, the composition of pmkToLeft and this
moniker) and then return the results of calling
IParseDisplayName::ParseDisplayName. There are different strategies
for getting an IParseDisplayName pointer, as follows:
This doc was truncated.


%index
IMoniker_IsSystemMoniker
Determines whether this moniker is one of the system-provided moniker classes.
%group
COM misc / IMoniker
%prm
this, pdwMksys
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pdwMksys : [int] A pointer to a variables that receives one of the values from the MKSYS enumeration and refers to one of the COM moniker classes. This parameter cannot be NULL.
%inst
Determines whether this moniker is one of the system-provided moniker
classes.

[戻り値]
This method returns S_OK to indicate that the moniker is a system
moniker, and S_FALSE otherwise.

[備考]
Notes to Callers New values of the MKSYS enumeration may be defined
in the future; therefore, you should explicitly test for each value
you are interested in. Notes to Implementers Your implementation of
this method must return MKSYS_NONE. You cannot use this function to
identify your own monikers (for example, in your implementation of
IMoniker::ComposeWith). Instead, you should use your moniker's
implementation of IPersist::GetClassID or use QueryInterface to test
for your own private interface. Implementation-specific Notes
This doc was truncated.


%index
IPersist_GetClassID
Retrieves the class identifier (CLSID) of the object.
%group
COM misc / IPersist
%prm
this, pClassID
this : [comobj] IPersist インターフェースの COM オブジェクト変数
pClassID : [var] A pointer to the location that receives the CLSID on return. The CLSID is a globally unique identifier (GUID) that uniquely represents an object class that defines the code that can manipulate the object's data.
%inst
Retrieves the class identifier (CLSID) of the object.

[戻り値]
If the method succeeds, the return value is S_OK. Otherwise, it is
E_FAIL.

[備考]
The GetClassID method retrieves the class identifier (CLSID) for an
object, used in later operations to load object-specific code into
the caller's context. Notes to Callers A container application might
call this method to retrieve the original CLSID of an object that it
is treating as a different class. Such a call would be necessary if a
user performed an editing operation that required the object to be
saved. If the container were to save it using the treat-as CLSID, the
original application would no longer be able to edit the object.
Typically, in this case, the container calls the OleSave helper
function, which performs all the necessary steps. For this reason,
most container applications have no need to call this method
directly. The exception would be a container that provides an object
handler for certain objects. In particular, a container application
should not get an object's CLSID and then use it to retrieve class
specific information from the registry. Instead, the container should
use IOleObject and IDataObject interfaces to retrieve such
class-specific information directly from the object. Notes to
Implementers Typically, implementations of this method simply supply
a constant CLSID for an object. If, however, the object's TreatAs
registry key has been set by an application that supports emulation
(and so is treating the object as one of a different class), a call
to GetClassID must supply the CLSID specified in the TreatAs key. For
more information on emulation, see CoTreatAsClass. When an object is
in the running state, the default handler calls an implementation of
GetClassID that delegates the call to the implementation in the
object. When the object is not running, the default handler instead
calls the ReadClassStg function to read the CLSID that is saved in
the object's storage. If you are writing a custom object handler for
your object, you might want to simply delegate this method to the
default handler implementation (see OleCreateDefaultHandler).
URL Moniker Notes This method returns CLSID_StdURLMoniker.


%index
IPersistFile_GetClassID
IPersistFile::GetClassID (vtable slot 3)
%group
COM misc / IPersistFile
%prm
this, pClassID
this : [comobj] IPersistFile インターフェースの COM オブジェクト変数
pClassID : [var] 
%inst


%index
IPersistFile_IsDirty
Determines whether an object has changed since it was last saved to its current file.
%group
COM misc / IPersistFile
%prm
this
this : [comobj] IPersistFile インターフェースの COM オブジェクト変数
%inst
Determines whether an object has changed since it was last saved to
its current file.

[戻り値]
This method returns S_OK to indicate that the object has changed.
Otherwise, it returns S_FALSE.

[備考]
Use this method to determine whether an object should be saved before
closing it. The dirty flag for an object is conditionally cleared in
the IPersistFile::Save method. Notes to Callers OLE does not call
IsDirty. Applications would not call it unless they are also saving
an object to a file. You should treat any error return codes as an
indication that the object has changed. Unless this method explicitly
returns S_FALSE, assume that the object must be saved. Notes to
Implementers An object with no contained objects simply checks its
dirty flag to return the appropriate result. A container with one or
more contained objects must maintain an internal dirty flag that is
set when any of its contained objects has changed since it was last
saved. To do this, the container should maintain an advise sink by
implementing the IAdviseSink interface. Then, the container can
register each link or embedding for data change notifications with a
call to IDataObject::DAdvise. Then, the container can set its
internal dirty flag when it receives an IAdviseSink::OnDataChange
notification. If the container does not register for data change
notifications, the IPersistFile::IsDirty implementation would call
IPersistStorage::IsDirty for each of its contained objects to
determine whether they have changed. The container can clear its
dirty flag whenever it is saved, as long as the file to which the
object is saved is the current working file after the save.
Therefore, the dirty flag would be cleared after a successful Save or
Save As operation, but not after a Save A Copy As . . . operation.


%index
IPersistFile_Load
Opens the specified file and initializes an object from the file contents.
%group
COM misc / IPersistFile
%prm
this, pszFileName, dwMode
this : [comobj] IPersistFile インターフェースの COM オブジェクト変数
pszFileName : [wstr] The absolute path of the file to be opened.
dwMode : [int] The access mode to be used when opening the file. Possible values are taken from the STGM enumeration. The method can treat this value as a suggestion, adding more restrictive permissions if necessary. If dwMode is 0, the implementation should open the file using whatever default permissions are used when a user opens the file.
%inst
Opens the specified file and initializes an object from the file
contents.

[戻り値]
This method can return the following values.
This doc was truncated.

[備考]
IPersistFile::Load loads the object from the specified file. This
method is for initialization only and does not show the object to the
end user. It is not equivalent to what occurs when a user selects the
File Open command. Notes to Callers The BindToObject method in file
monikers calls this method to load an object during a moniker binding
operation (when a linked object is run). Typically, applications do
not call this method directly. Notes to Implementers Because the
information needed to open a file varies greatly from one application
to another, the object on which this method is implemented must also
open the file specified by the pszFileName parameter. This differs
from the IPersistStorage::Load and IPersistStream::Load, in which the
caller opens the storage or stream and then passes an open storage or
stream pointer to the loaded object. For an application that normally
uses OLE compound files, your IPersistFile::Load implementation can
simply call the StgOpenStorage function to open the storage object in
the specified file. Then, you can proceed with normal initialization.
Applications that do not use storage objects can perform normal
file-opening procedures. When the object has been loaded, your
implementation should register the object in the running object table
(see IRunningObjectTable::Register).


%index
IPersistFile_Save
Saves a copy of the object to the specified file.
%group
COM misc / IPersistFile
%prm
this, pszFileName, fRemember
this : [comobj] IPersistFile インターフェースの COM オブジェクト変数
pszFileName : [wstr] The absolute path of the file to which the object should be saved. If pszFileName is NULL, the object should save its data to the current file, if there is one.
fRemember : [int] Indicates whether the pszFileName parameter is to be used as the current working file. If TRUE, pszFileName becomes the current file and the object should clear its dirty flag after the save. If FALSE, this save operation is a Save A Copy As ... operation. In this case, the current file is unchanged and the object should not clear its dirty flag. If pszFileName is NULL, the implementation should ignore the fRemember flag.
%inst
Saves a copy of the object to the specified file.

[戻り値]
If the object was successfully saved, the return value is S_OK.
Otherwise, it is S_FALSE. This method can also return various storage
errors.

[備考]
This method can be called to save an object to the specified file in
one of three ways:
The implementer must detect which type of save operation the caller
is requesting. If the pszFileName parameter is NULL, a Save is being
requested. If the pszFileName parameter is not NULL, use the value of
the fRemember parameter to distinguish between a Save As and a Save a
Copy As. In Save or Save As operations, IPersistFile::Save clears the
internal dirty flag after the save and sends IAdviseSink::OnSave
notifications to any advisory connections (see also
IOleAdviseHolder::SendOnSave). Also, in these operations, the object
is in NoScribble mode until it receives an
IPersistFile::SaveCompleted call. In NoScribble mode, the object must
not write to the file. In the Save As scenario, the implementation
should also send IAdviseSink::OnRename notifications to any advisory
connections (see also IOleAdviseHolder::SendOnRename). In the Save a
Copy As scenario, the implementation does not clear the internal
dirty flag after the save. Notes to Callers OLE does not call
IPersistFile::Save. Typically, applications would not call it unless
they are saving an object to a file directly, which is generally left
to the end-user.


%index
IPersistFile_SaveCompleted
Notifies the object that it can write to its file.
%group
COM misc / IPersistFile
%prm
this, pszFileName
this : [comobj] IPersistFile インターフェースの COM オブジェクト変数
pszFileName : [wstr] The absolute path of the file where the object was saved previously.
%inst
Notifies the object that it can write to its file.

[戻り値]
This method always returns S_OK.

[備考]
SaveCompleted is called when a call to IPersistFile::Save is
completed, and the file that was saved is now the current working
file (having been saved with Save or Save As operations). The call to
Save puts the object into NoScribble mode so it cannot write to its
file. When SaveCompleted is called, the object reverts to Normal
mode, in which it is free to write to its file. Notes to Callers OLE
does not call the SaveCompleted method. Typically, applications would
not call it unless they are saving objects directly to files, an
operation which is generally left to the end-user.


%index
IPersistFile_GetCurFile
Retrieves the current name of the file associated with the object. If there is no current working file, this method retrieves the default save prompt for the object.
%group
COM misc / IPersistFile
%prm
this, ppszFileName
this : [comobj] IPersistFile インターフェースの COM オブジェクト変数
ppszFileName : [var] The path for the current file or the default file name prompt (such as *.txt). If an error occurs, ppszFileName is set to NULL.
%inst
Retrieves the current name of the file associated with the object. If
there is no current working file, this method retrieves the default
save prompt for the object.

[戻り値]
This method can return the following values.
This doc was truncated.

[備考]
This method allocates memory for the string returned in the
ppszFileName parameter using the IMalloc::Alloc method. The caller is
responsible for calling the IMalloc::Free method to free the string.
Both the caller and this method use the OLE task allocator provided
by a call to CoGetMalloc. The file name returned in ppszFileName is
the name specified in a call to IPersistFile::Load when the document
was loaded; or in IPersistFile::SaveCompleted if the document was
saved to a different file. If the object does not have a current
working file, it should provide the default prompt that it would
display in a Save As dialog box. For example, the default save prompt
for a word processor object could be "*.txt". Notes to Callers OLE
does not call the GetCurFile method. Applications would not call this
method unless they are also calling the save methods of this
interface. In saving the object, you can call this method before
calling IPersistFile::Save to determine whether the object has an
associated file. If this method returns S_OK, you can then call
IPersistFile::Save with a NULL filename and a TRUE value for the
fRemember parameter to tell the object to save itself to its current
file. If this method returns S_FALSE, you can use the save prompt
returned in the ppszFileName parameter to ask the end user to provide
a file name. Then, you can call IPersistFile::Save with the file name
that the user entered to perform a Save As operation.


%index
IPersistStream_GetClassID
IPersistStream::GetClassID (vtable slot 3)
%group
COM misc / IPersistStream
%prm
this, pClassID
this : [comobj] IPersistStream インターフェースの COM オブジェクト変数
pClassID : [var] 
%inst


%index
IPersistStream_IsDirty
Determines whether an object has changed since it was last saved to its stream. (IPersistStream.IsDirty)
%group
COM misc / IPersistStream
%prm
this
this : [comobj] IPersistStream インターフェースの COM オブジェクト変数
%inst
Determines whether an object has changed since it was last saved to
its stream. (IPersistStream.IsDirty)

[戻り値]
This method returns S_OK to indicate that the object has changed.
Otherwise, it returns S_FALSE.

[備考]
Use this method to determine whether an object should be saved before
closing it. The dirty flag for an object is conditionally cleared in
the IPersistStream::Save method. Notes to Callers You should treat
any error return codes as an indication that the object has changed.
Unless this method explicitly returns S_FALSE, assume that the object
must be saved. Note that the OLE-provided implementations of the
IPersistStream::IsDirty method in the OLE-provided moniker interfaces
always return S_FALSE because their internal state never changes.


%index
IPersistStream_Load
Initializes an object from the stream where it was saved previously. (IPersistStream.Load)
%group
COM misc / IPersistStream
%prm
this, pStm
this : [comobj] IPersistStream インターフェースの COM オブジェクト変数
pStm : [comobj] An IStream pointer to the stream from which the object should be loaded.
%inst
Initializes an object from the stream where it was saved previously.
(IPersistStream.Load)

[戻り値]
This method can return the following values.
This doc was truncated.

[備考]
This method loads an object from its associated stream. The seek
pointer is set as it was in the most recent IPersistStream::Save
method. This method can seek and read from the stream, but cannot
write to it. Notes to Callers Rather than calling
IPersistStream::Load directly, you typically call the
OleLoadFromStream function does the following:
This doc was truncated.


%index
IPersistStream_Save
Saves an object to the specified stream. (IPersistStream.Save)
%group
COM misc / IPersistStream
%prm
this, pStm, fClearDirty
this : [comobj] IPersistStream インターフェースの COM オブジェクト変数
pStm : [comobj] An IStream pointer to the stream into which the object should be saved.
fClearDirty : [int] Indicates whether to clear the dirty flag after the save is complete. If TRUE, the flag should be cleared. If FALSE, the flag should be left unchanged.
%inst
Saves an object to the specified stream. (IPersistStream.Save)

[戻り値]
This method can return the following values.
This doc was truncated.

[備考]
IPersistStream::Save saves an object into the specified stream and
indicates whether the object should reset its dirty flag. The seek
pointer is positioned at the location in the stream at which the
object should begin writing its data. The object calls the
ISequentialStream::Write method to write its data. On exit, the seek
pointer must be positioned immediately past the object data. The
position of the seek pointer is undefined if an error returns. Notes
to Callers Rather than calling IPersistStream::Save directly, you
typically call the OleSaveToStream helper function which does the
following:
This doc was truncated.


%index
IPersistStream_GetSizeMax
Retrieves the size of the stream needed to save the object. (IPersistStream.GetSizeMax)
%group
COM misc / IPersistStream
%prm
this, pcbSize
this : [comobj] IPersistStream インターフェースの COM オブジェクト変数
pcbSize : [int64] The size in bytes of the stream needed to save this object, in bytes.
%inst
Retrieves the size of the stream needed to save the object.
(IPersistStream.GetSizeMax)

[戻り値]
This method returns S_OK to indicate that the size was retrieved
successfully.

[備考]
This method returns the size needed to save an object. You can call
this method to determine the size and set the necessary buffers
before calling the IPersistStream::Save method. Notes to Implementers
The GetSizeMax implementation should return a conservative estimate
of the necessary size because the caller might call the
IPersistStream::Save method with a non-growable stream. URL Moniker
Notes This method retrieves the maximum number of bytes in the stream
that will be required by a subsequent call to IPersistStream::Save.
This value is sizeof(ULONG)==4 plus sizeof(WCHAR)*n where n is the
length of the full or partial URL string, including the NULL
terminator.


%index
IPropertyDescriptionList_GetCount
Gets the number of properties included in the property list.
%group
COM misc / IPropertyDescriptionList
%prm
this, pcElem
this : [comobj] IPropertyDescriptionList インターフェースの COM オブジェクト変数
pcElem : [int] Type: UINT* When this method returns, contains a pointer to the count of properties.
%inst
Gets the number of properties included in the property list.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IPropertyDescriptionList_GetAt
Gets the property description at the specified index in a property description list.
%group
COM misc / IPropertyDescriptionList
%prm
this, iElem, riid, ppv
this : [comobj] IPropertyDescriptionList インターフェースの COM オブジェクト変数
iElem : [int] Type: UINT The number of the property in the list string.
riid : [var] Type: REFIID A reference to the IID of the requested property description interface, typically IID_IPropertyDescription.
ppv : [int] Type: void** When this method returns, contains the interface pointer requested in riid. Typically, this is IPropertyDescription.
%inst
Gets the property description at the specified index in a property
description list.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
It is recommended that you use the IID_PPV_ARGS macro, defined in
objbase.h, to package the riid and ppv parameters. This macro
provides the correct IID based on the interface pointed to by the
value in ppv, eliminating the possibility of a coding error.


%index
IPropertyStore_GetCount
This method returns a count of the number of properties that are attached to the file.
%group
COM misc / IPropertyStore
%prm
this, cProps
this : [comobj] IPropertyStore インターフェースの COM オブジェクト変数
cProps : [int] A pointer to a value that indicates the property count.
%inst
This method returns a count of the number of properties that are
attached to the file.

[戻り値]
The IpropertyStore::GetCount method returns a value of S_OK when the
call is successful, even if the file has no properties attached. Any
other code returned is an error code.

[備考]
IPropertyStore provides an abstraction over an array of property keys
via the IPropertyStore::GetCount and IPropertyStore::GetAt methods.
The property keys in this array represent the properties that are
currently stored by the IPropertyStore. When GetCount succeeds, the
value pointed to by cProps is a count of property keys in the array.
The caller can expect calls to IPropertyStore::GetAt to succeed for
values of iProp less than cProps. In the case of failures such as
E_OUTOFMEMORY, you should set cProps to zero. It is preferable that
errors are discovered during creation or initialization of the
property store.


%index
IPropertyStore_GetAt
Gets a property key from the property array of an item.
%group
COM misc / IPropertyStore
%prm
this, iProp, pkey
this : [comobj] IPropertyStore インターフェースの COM オブジェクト変数
iProp : [int] The index of the property key in the array of PROPERTYKEY structures. This is a zero-based index.
pkey : [var] TBD
%inst
Gets a property key from the property array of an item.

[戻り値]
The IPropertyStore::GetAt method returns a value of S_OK if
successful. Otherwise, any other code it returns must be considered
to be an error code.

[備考]
None


%index
IPropertyStore_GetValue
This method retrieves the data for a specific property.
%group
COM misc / IPropertyStore
%prm
this, key, pv
this : [comobj] IPropertyStore インターフェースの COM オブジェクト変数
key : [var] TBD
pv : [int] After the IPropertyStore::GetValue method returns successfully, this parameter points to a PROPVARIANT  structure that contains data about the property.
%inst
This method retrieves the data for a specific property.

[戻り値]
Returns S_OK or INPLACE_S_TRUNCATED if successful, or an error value
otherwise. INPLACE_S_TRUNCATED is returned to indicate that the
returned PROPVARIANT was converted into a more canonical form. For
example, this would be done to trim leading or trailing spaces from a
string value. You must use the SUCCEEDED macro to check the return
value, which treats INPLACE_S_TRUNCATED as a success code. The
SUCCEEDED macro is defined in the Winerror.h file.

[備考]
If the PROPERTYKEY referenced in key is not present in the property
store, this method returns S_OK and the vt member of the structure
that is pointed to by pv is set to VT_EMPTY.


%index
IPropertyStore_SetValue
This method sets a property value or replaces or removes an existing value.
%group
COM misc / IPropertyStore
%prm
this, key, propvar
this : [comobj] IPropertyStore インターフェースの COM オブジェクト変数
key : [var] TBD
propvar : [int] TBD
%inst
This method sets a property value or replaces or removes an existing
value.

[戻り値]
The IPropertyStore::SetValue method can return any one of the
following:
This doc was truncated.

[備考]
IPropertyStore::SetValue affects the current property store instance
only. A property handler implements IPropertyStore::SetValue by
accumulating property changes in an in-memory data structure.
Property changes are written to the stream only when
IPropertyStore::Commit is called. If IPropertyStore::Commit is called
on a read-only property store, the property handler determines this
and returns STG_E_ACCESSDENIED. If a value was added or removed as a
result of SetValue, subsequent enumerations by
IPropertyStore::GetCount and IPropertyStore::GetAt reflect that
change and subsequent calls to IPropertyStore::SetValue reflect the
changed value. Adding a New Property If the property value that was
pointed to by key does not exist in the store,
IPropertyStore::SetValue adds the value to the store. Replacing an
Existing Property Value If the property value that was pointed to by
key already exists in the store, the stored value is replaced.
Removing an Existing Property To remove a value from the property
store, set the vt member of the structure that is pointed to by pv to
VT_EMPTY. If that value is not present, do nothing and the method
returns S_OK.


%index
IPropertyStore_Commit
After a change has been made, this method saves the changes.
%group
COM misc / IPropertyStore
%prm
this
this : [comobj] IPropertyStore インターフェースの COM オブジェクト変数
%inst
After a change has been made, this method saves the changes.

[戻り値]
The IPropertyStore::Commit method returns any one of the following:
This doc was truncated.

[備考]
Before the Commit method returns, it releases the file stream or path
that was initialized to be used by the method. Therefore, no
IPropertyStore methods succeed after Commit returns. At that point,
they return E_FAIL. Property handlers must ensure that property
changes result in a valid destination file, even if the Commit
process terminates abnormally, or encounters any errors.


%index
IRunningObjectTable_Register
Registers an object and its identifying moniker in the running object table (ROT).
%group
COM misc / IRunningObjectTable
%prm
this, grfFlags, punkObject, pmkObjectName, pdwRegister
this : [comobj] IRunningObjectTable インターフェースの COM オブジェクト変数
grfFlags : [int] Specifies whether the ROT's reference to punkObject is weak or strong and controls access to the object through its entry in the ROT. For details, see the Remarks section.
punkObject : [int] A pointer to the object that is being registered as running.
pmkObjectName : [comobj] A pointer to the moniker that identifies punkObject.
pdwRegister : [int] An identifier for this ROT entry that can be used in subsequent calls to IRunningObjectTable::Revoke or IRunningObjectTable::NoteChangeTime. The caller cannot specify NULL for this parameter. If an error occurs, *pdwRegister is set to zero.
%inst
Registers an object and its identifying moniker in the running object
table (ROT).

[戻り値]
This method can return the standard return values E_INVALIDARG and
E_OUTOFMEMORY, as well as the following values.
This doc was truncated.

[備考]
This method registers a pointer to an object under a moniker that
identifies the object. The moniker is used as the key when the table
is searched with IRunningObjectTable::GetObject. When an object is
registered, the ROT always calls AddRef on the object. For a weak
registration (ROTFLAGS_REGISTRATIONKEEPSALIVE not set), the ROT will
release the object whenever the last strong reference to the object
is released. For a strong registration
(ROTFLAGS_REGISTRATIONKEEPSALIVE set), the ROT prevents the object
from being destroyed until the object's registration is explicitly
revoked. A server registered as either LocalService or RunAs can set
the ROTFLAGS_ALLOWANYCLIENT flag in its call to Register to allow any
client to connect to it. A server setting this bit must have its
executable name in the AppID section of the registry that refers to
the AppID for the executable. An "activate as activator" server (not
registered as LocalService or RunAs) must not set this flag in its
call to Register. For details on installing services, see Installing
as a Service Application. Registering a second object with the same
moniker, or re-registering the same object with the same moniker,
creates a second entry in the ROT. In this case, Register returns
MK_S_MONIKERALREADYREGISTERED. Each call to Register must be matched
by a call to IRunningObjectTable::Revoke because even duplicate
entries have different pdwRegister identifiers. A problem with
duplicate registrations is that there is no way to determine which
object will be returned if the moniker is specified in a subsequent
call to IRunningObjectTable::IsRunning. Notes to Callers If you are a
moniker provider (that is, you hand out monikers identifying your
objects to make them accessible to others), you must call the
Register method to register your objects when they begin running. You
must also call this method if you rename your objects while they are
loaded.
The most common type of moniker provider is a compound-document link
source. This includes server applications that support linking to
their documents (or portions of a document) and container
applications that support linking to embeddings within their
documents. Server applications that do not support linking can also
use the ROT to cooperate with container applications that support
linking to embeddings.
If you are writing a server application, you should register an
object with the ROT when it begins running, typically in your
implementation of IOleObject::DoVerb. The object must be registered
under its full moniker, which requires getting the moniker of its
container document using IOleClientSite::GetMoniker. You should also
revoke and re-register the object in your implementation of
IOleObject::SetMoniker, which is called if the container document is
renamed. If you are writing a container application that supports
linking to embeddings, you should register your document with the ROT
when it is loaded. If your document is renamed, you should revoke and
re-register it with the ROT and call IOleObject::SetMoniker for any
embedded objects in the document to give them an opportunity to
re-register themselves. Objects registered in the ROT must be
explicitly revoked when the object is no longer running or when its
moniker changes. This revocation is important because there is no way
for the system to automatically remove entries from the ROT. You must
cache the identifier that is written through pdwRegister and use it
in a call to IRunningObjectTable::Revoke to revoke the registration.
For a strong registration, a strong reference is released when the
objects registration is revoked. As of Windows Server 2003, if there
are stale entries that remain in the ROT due to unexpected server
problems, COM will automatically remove these stale entries from the
ROT. The system's implementation of Register calls IMoniker::Reduce
on the pmkObjectName parameter to ensure that the moniker is fully
reduced before registration. If an object is known by more than one
fully reduced moniker, it should be registered under all such
monikers.


%index
IRunningObjectTable_Revoke
Removes an entry from the running object table (ROT) that was previously registered by a call to IRunningObjectTable::Register.
%group
COM misc / IRunningObjectTable
%prm
this, dwRegister
this : [comobj] IRunningObjectTable インターフェースの COM オブジェクト変数
dwRegister : [int] The identifier of the ROT entry to be revoked.
%inst
Removes an entry from the running object table (ROT) that was
previously registered by a call to IRunningObjectTable::Register.

[戻り値]
This method can return the standard return values E_INVALIDARG and
S_OK.

[備考]
This method undoes the effect of a call to
IRunningObjectTable::Register, removing both the moniker and the
pointer to the object identified by that moniker. Notes to Callers A
moniker provider (hands out monikers identifying its objects to make
them accessible to others) must call the Revoke method to revoke the
registration of its objects when it stops running. It must have
previously called IRunningObjectTable::Register and stored the
identifier returned by that method; it uses that identifier when
calling Revoke. The most common type of moniker provider is a
compound-document link source. This includes server applications that
support linking to their documents (or portions of a document) and
container applications that support linking to embeddings within
their documents. Server applications that do not support linking can
also use the ROT to cooperate with container applications that
support linking to embeddings. If you are writing a container
application, you must revoke a document's registration when the
document is closed. You must also revoke a document's registration
before re-registering it when it is renamed.
If you are writing a server application, you must revoke an object's
registration when the object is closed. You must also revoke an
object's registration before re-registering it when its container
document is renamed (see IOleObject::SetMoniker).


%index
IRunningObjectTable_IsRunning
Determines whether the object identified by the specified moniker is currently running.
%group
COM misc / IRunningObjectTable
%prm
this, pmkObjectName
this : [comobj] IRunningObjectTable インターフェースの COM オブジェクト変数
pmkObjectName : [comobj] A pointer to the IMoniker interface on the moniker.
%inst
Determines whether the object identified by the specified moniker is
currently running.

[戻り値]
If the object is in the running state, the return value is TRUE.
Otherwise, it is FALSE.

[備考]
This method simply indicates whether a object is running. To retrieve
a pointer to a running object, use the IRunningObjectTable::GetObject
method. Notes to Callers Generally, you call the IsRunning method
only if you are writing your own moniker class (that is, implementing
the IMoniker interface). You typically call this method from your
implementation of IMoniker::IsRunning. However, you should do so only
if the pmkToLeft parameter of IMoniker::IsRunning is NULL. Otherwise,
you should call IMoniker::IsRunning on your pmkToLeft parameter
instead.


%index
IRunningObjectTable_GetObject
Determines whether the object identified by the specified moniker is running, and if it is, retrieves a pointer to that object.
%group
COM misc / IRunningObjectTable
%prm
this, pmkObjectName, ppunkObject
this : [comobj] IRunningObjectTable インターフェースの COM オブジェクト変数
pmkObjectName : [comobj] A pointer to the IMoniker interface on the moniker.
ppunkObject : [int] A pointer to an IUnknown pointer variable that receives the interface pointer to the running object. When successful, the implementation calls AddRef on the object; it is the caller's responsibility to call Release. If the object is not running or if an error occurs, the implementation sets *ppunkObject to NULL.
%inst
Determines whether the object identified by the specified moniker is
running, and if it is, retrieves a pointer to that object.

[戻り値]
This method can return the following values.
This doc was truncated.

[備考]
This method checks the ROT for the moniker specified by
pmkObjectName. If that moniker had previously been registered with a
call to IRunningObjectTable::Register, this method returns the
pointer that was registered at that time. Notes to Callers Generally,
you call the IRunningObjectTable::GetObject method only if you are
writing your own moniker class (that is, implementing the IMoniker
interface). You typically call this method from your implementation
of IMoniker::BindToObject. However, note that not all implementations
of IMoniker::BindToObject need to call this method. If you expect
your moniker to have a prefix (indicated by a non-NULLpmkToLeft
parameter to IMoniker::BindToObject), you should not check the ROT.
The reason for this is that only complete monikers are registered
with the ROT, and if your moniker has a prefix, your moniker is part
of a composite and thus not complete. Instead, your moniker should
request services from the object identified by the prefix (for
example, the container of the object identified by your moniker).


%index
IRunningObjectTable_NoteChangeTime
Records the time that a running object was last modified. The object must have previously been registered with the running object table (ROT). This method stores the time of last change in the ROT.
%group
COM misc / IRunningObjectTable
%prm
this, dwRegister, pfiletime
this : [comobj] IRunningObjectTable インターフェースの COM オブジェクト変数
dwRegister : [int] The identifier of the ROT entry of the changed object. This value was previously returned by IRunningObjectTable::Register.
pfiletime : [var] A pointer to a FILETIME structure containing the object's last change time.
%inst
Records the time that a running object was last modified. The object
must have previously been registered with the running object table
(ROT). This method stores the time of last change in the ROT.

[戻り値]
This method can return the standard return values E_INVALIDARG and
S_OK.

[備考]
The time recorded by this method can be retrieved by calling
IRunningObjectTable::GetTimeOfLastChange. Notes to Callers A moniker
provider (hands out monikers identifying its objects to make them
accessible to others) must call the NoteChangeTime method whenever
its objects are modified. It must have previously called
IRunningObjectTable::Register and stored the identifier returned by
that method; it uses that identifier when calling NoteChangeTime.
The most common type of moniker provider is a compound-document link
source. This includes server applications that support linking to
their documents (or portions of a document) and container
applications that support linking to embeddings within their
documents. Server applications that do not support linking can also
use the ROT to cooperate with container applications that support
linking to embeddings.
When an object is first registered in the ROT, the ROT records its
last change time as the value returned by calling
IMoniker::GetTimeOfLastChange on the moniker being registered.


%index
IRunningObjectTable_GetTimeOfLastChange
Retrieves the time that an object was last modified.
%group
COM misc / IRunningObjectTable
%prm
this, pmkObjectName, pfiletime
this : [comobj] IRunningObjectTable インターフェースの COM オブジェクト変数
pmkObjectName : [comobj] A pointer to the IMoniker interface on the moniker.
pfiletime : [var] A pointer to a FILETIME structure that receives the object's last change time.
%inst
Retrieves the time that an object was last modified.

[戻り値]
This method can return the following values.
This doc was truncated.

[備考]
This method returns the change time that was last reported for this
object by a call to IRunningObjectTable::NoteChangeTime. If
NoteChangeTime has not been called previously, the method returns the
time that was recorded when the object was registered. This method is
provided to enable checking whether a connection between two objects
(represented by one object holding a moniker that identifies the
other) is up-to-date. For example, if one object is holding cached
information about the other object, this method can be used to check
whether the object has been modified since the cache was last
updated. See IMoniker::GetTimeOfLastChange. Notes to Callers
Generally, you call GetTimeOfLastChange only if you are writing your
own moniker class (that is, implementing the IMoniker interface). You
typically call this method from your implementation of
IMoniker::GetTimeOfLastChange. However, you should do so only if the
pmkToLeft parameter of IMoniker::GetTimeOfLastChange is NULL.
Otherwise, you should call IMoniker::GetTimeOfLastChange on your
pmkToLeft parameter instead.


%index
IRunningObjectTable_EnumRunning
Creates and returns a pointer to an enumerator that can list the monikers of all the objects currently registered in the running object table (ROT).
%group
COM misc / IRunningObjectTable
%prm
this, ppenumMoniker
this : [comobj] IRunningObjectTable インターフェースの COM オブジェクト変数
ppenumMoniker : [comobj] A pointer to an IEnumMoniker pointer variable that receives the interface pointer to the new enumerator for the ROT. When successful, the implementation calls AddRef on the enumerator; it is the caller's responsibility to call Release. If an error occurs; the implementation sets *ppenumMoniker to NULL.
%inst
Creates and returns a pointer to an enumerator that can list the
monikers of all the objects currently registered in the running
object table (ROT).

[戻り値]
This method can return the standard return values E_OUTOFMEMORY and
S_OK.

[備考]
IRunningObjectTable::EnumRunning must create and return a pointer to
an IEnumMoniker interface on an enumerator object. The standard
enumerator methods can then be called to enumerate the monikers
currently registered in the registry. The enumerator cannot be used
to enumerate monikers that are registered in the ROT after the
enumerator has been created. The EnumRunning method is intended
primarily for the use by the system in implementing the alert object
table. Note that OLE 2 does not include an implementation of the
alert object table.


%index
ISequentialStream_Read
Reads a specified number of bytes from the stream object into memory, starting at the current seek pointer.
%group
COM misc / ISequentialStream
%prm
this, pv, cb, pcbRead
this : [comobj] ISequentialStream インターフェースの COM オブジェクト変数
pv : [intptr] A pointer to the buffer which the stream data is read into.
cb : [int] The number of bytes of data to read from the stream object.
pcbRead : [var] A pointer to a ULONG variable that receives the actual number of bytes read from the stream object. Note??The number of bytes read may be zero.
%inst
Reads a specified number of bytes from the stream object into memory,
starting at the current seek pointer.

[戻り値]
This method can return one of these values. | Return code |
Description | |----------------|---------------| |S_OK | All of the
requested data was successfully read from the stream object; the
number of bytes requested in *cb* is the same as the number of bytes
returned in *pcbRead*.| |S_FALSE | The value returned in *pcbRead* is
less than the number of bytes requested in *cb*. This indicates the
end of the stream has been reached. The number of bytes read
indicates how much of the *pv* buffer has been filled.| |E_PENDING |
Asynchronous storage only: Part or all of the data to be read is
currently unavailable. | |STG_E_ACCESSDENIED | The caller does not
have permissions required to read this stream object.|
|STG_E_INVALIDPOINTER | One of the pointer values is invalid.|
|STG_E_REVERTED | The object has been invalidated by a revert
operation above it in the transaction tree.|

[備考]
This method reads bytes from this stream object into memory. The
stream object must be opened in STGM_READ mode. This method adjusts
the seek pointer by the actual number of bytes read. The number of
bytes actually read is also returned in the pcbRead parameter. Notes
to Callers The actual number of bytes read can be less than the
number of bytes requested if an error occurs or if the end of the
stream is reached during the read operation. The number of bytes
returned should always be compared to the number of bytes requested.
If the number of bytes returned is less than the number of bytes
requested, it usually means the Read method attempted to read past
the end of the stream. The application should handle both a returned
error and S_OK return values on end-of-stream read operations.


%index
ISequentialStream_Write
Writes a specified number of bytes into the stream object starting at the current seek pointer.
%group
COM misc / ISequentialStream
%prm
this, pv, cb, pcbWritten
this : [comobj] ISequentialStream インターフェースの COM オブジェクト変数
pv : [intptr] A pointer to the buffer that contains the data that is to be written to the stream. A valid pointer must be provided for this parameter even when cb is zero.
cb : [int] The number of bytes of data to attempt to write into the stream. This value can be zero.
pcbWritten : [var] A pointer to a ULONG variable where this method writes the actual number of bytes written to the stream object. The caller can set this pointer to NULL, in which case this method does not provide the actual number of bytes written.
%inst
Writes a specified number of bytes into the stream object starting at
the current seek pointer.

[戻り値]
This method can return one of these values. | Return code |
Description | |----------------|---------------| |S_OK | The data was
successfully written to the stream object.| |E_PENDING | Asynchronous
Storage only: Part or all of the data to be written is currently
unavailable.| |STG_E_MEDIUMFULL | The write operation failed because
there is no space left on the storage device.| |STG_E_ACCESSDENIED |
The caller does not have the required permissions for writing to this
stream object.| |STG_E_CANTSAVE | Data cannot be written for reasons
other than improper access or insufficient space.|
|STG_E_INVALIDPOINTER | One of the pointer values is not valid. The
*pv* parameter must contain a valid pointer even if *cb* is zero.|
|STG_E_REVERTED | The object has been invalidated by a revert
operation above it in the transaction tree.| |STG_E_WRITEFAULT | The
write operation failed due to a disk error. This value is also
returned when this method attempts to write to a stream that was
opened in simple mode (using the STGM_SIMPLE flag).|

[備考]
ISequentialStream::Write writes the specified data to a stream
object. The seek pointer is adjusted for the number of bytes actually
written. The number of bytes actually written is returned in the
pcbWritten parameter. If the byte count is zero bytes, the write
operation has no effect. If the seek pointer is currently past the
end of the stream and the byte count is nonzero, this method
increases the size of the stream to the seek pointer and writes the
specified bytes starting at the seek pointer. The fill bytes written
to the stream are not initialized to any particular value. This is
the same as the end-of-file behavior in the MS-DOS FAT file system.
With a zero byte count and a seek pointer past the end of the stream,
this method does not create the fill bytes to increase the stream to
the seek pointer. In this case, you must call the IStream::SetSize
method to increase the size of the stream and write the fill bytes.
The pcbWritten parameter can have a value even if an error occurs. In
the COM-provided implementation, stream objects are not sparse. Any
fill bytes are eventually allocated on the disk and assigned to the
stream.


%index
IShellItem_BindToHandler
Binds to a handler for an item as specified by the handler ID value (BHID).
%group
COM misc / IShellItem
%prm
this, pbc, bhid, riid, ppv
this : [comobj] IShellItem インターフェースの COM オブジェクト変数
pbc : [comobj] Type: IBindCtx* A pointer to an IBindCtx interface on a bind context object. Used to pass optional parameters to the handler. The contents of the bind context are handler-specific. For example, when binding to BHID_Stream, the STGM flags in the bind context indicate the mode of access desired (read or read/write).
bhid : [var] Type: REFGUID
riid : [var] Type: REFIID IID of the object type to retrieve.
ppv : [int] Type: void** When this method returns, contains a pointer of type riid that is returned by the handler specified by rbhid.
%inst
Binds to a handler for an item as specified by the handler ID value
(BHID).

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IShellItem_GetParent
Gets the parent of an IShellItem object.
%group
COM misc / IShellItem
%prm
this, ppsi
this : [comobj] IShellItem インターフェースの COM オブジェクト変数
ppsi : [comobj] Type: IShellItem** The address of a pointer to the parent of an IShellItem interface.
%inst
Gets the parent of an IShellItem object.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise.


%index
IShellItem_GetDisplayName
Gets the display name of the IShellItem object.
%group
COM misc / IShellItem
%prm
this, sigdnName, ppszName
this : [comobj] IShellItem インターフェースの COM オブジェクト変数
sigdnName : [int] Type: SIGDN One of the SIGDN values that indicates how the name should look.
ppszName : [var] Type: LPWSTR* A value that, when this function returns successfully, receives the address of a pointer to the retrieved display name.
%inst
Gets the display name of the IShellItem object.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
It is the responsibility of the caller to free the string pointed to
by ppszName when it is no longer needed. Call CoTaskMemFree on
*ppszName to free the memory.


%index
IShellItem_GetAttributes
Gets a requested set of attributes of the IShellItem object.
%group
COM misc / IShellItem
%prm
this, sfgaoMask, psfgaoAttribs
this : [comobj] IShellItem インターフェースの COM オブジェクト変数
sfgaoMask : [int] Type: SFGAOF Specifies the attributes to retrieve. One or more of the SFGAO values. Use a bitwise OR operator to determine the attributes to retrieve.
psfgaoAttribs : [var] Type: SFGAOF* A pointer to a value that, when this method returns successfully, contains the requested attributes. One or more of the SFGAO values. Only those attributes specified by sfgaoMask are returned; other attribute values are undefined.
%inst
Gets a requested set of attributes of the IShellItem object.

[戻り値]
Type: HRESULT Returns S_OK if the attributes returned exactly match
those requested in sfgaoMask, S_FALSE if the attributes do not
exactly match, or a standard COM error value otherwise.


%index
IShellItem_Compare
Compares two IShellItem objects.
%group
COM misc / IShellItem
%prm
this, psi, hint, piOrder
this : [comobj] IShellItem インターフェースの COM オブジェクト変数
psi : [comobj] Type: IShellItem* A pointer to an IShellItem object to compare with the existing IShellItem object.
hint : [int] Type: SICHINTF One of the SICHINTF values that determines how to perform the comparison. See SICHINTF for the list of possible values for this parameter.
piOrder : [int] Type: int* This parameter receives the result of the comparison. If the two items are the same this parameter equals zero; if they are different the parameter is nonzero.
%inst
Compares two IShellItem objects.

[戻り値]
Type: HRESULT Returns S_OK if the items are the same, S_FALSE if they
are different, or an error value otherwise.

[備考]
The data type used in the second parameter, SICHINTF, is defined as:
This doc was truncated.


%index
IShellItemArray_BindToHandler
Binds to an object by means of the specified handler.
%group
COM misc / IShellItemArray
%prm
this, pbc, bhid, riid, ppvOut
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
pbc : [comobj] Type: IBindCtx* A pointer to an IBindCtx interface on a bind context object.
bhid : [var] Type: REFGUID
riid : [var] Type: REFIID The IID of the object type to retrieve.
ppvOut : [int] Type: void** When this methods returns, contains the object specified in riid that is returned by the handler specified by rbhid.
%inst
Binds to an object by means of the specified handler.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IShellItemArray_GetPropertyStore
Gets a property store.
%group
COM misc / IShellItemArray
%prm
this, flags, riid, ppv
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
flags : [int] Type: GETPROPERTYSTOREFLAGS One of the GETPROPERTYSTOREFLAGS constants.
riid : [var] Type: REFIID The IID of the object type to retrieve.
ppv : [int] Type: void** When this method returns, contains interface pointer requested in riid.  This is typically IPropertyStore or IPropertyStoreCapabilities.
%inst
Gets a property store.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This method is used to obtain a read-only property store that
aggregates properties gathered from all the items in the shell item
array. If there is more than one item in the shell item array, then
the resulting property store will aggregate the values from each item
according to a set of rules determined by each property. Values read
from the property store will be coerced to a canonical form prior to
aggregation as discussed at CoerceToCanonicalValue. The output from a
call to IPropertyStore::GetValue is computed as follows:
This doc was truncated.


%index
IShellItemArray_GetPropertyDescriptionList
Gets a property description list for the items in the shell item array.
%group
COM misc / IShellItemArray
%prm
this, keyType, riid, ppv
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
keyType : [var] Type: REFPROPERTYKEY A reference to the PROPERTYKEY structure specifying which property list to retrieve.
riid : [var] Type: REFIID The IID of the object type to retrieve.
ppv : [int] Type: void** When this method returns, contains the interface requested in riid.  This will typically be IPropertyDescriptionList.
%inst
Gets a property description list for the items in the shell item
array.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This function is used to determine a list of properties that are
applicable to a set of shell items. The type of list is specified by
a PROPERTYKEY structure. Supported list types include but are not
limited to:
This doc was truncated.


%index
IShellItemArray_GetAttributes
Gets the attributes of the set of items contained in an IShellItemArray.
%group
COM misc / IShellItemArray
%prm
this, AttribFlags, sfgaoMask, psfgaoAttribs
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
AttribFlags : [int] Type: SIATTRIBFLAGS
sfgaoMask : [int] Type: SFGAOF A mask that specifies what particular attributes are being requested. A bitwise OR of one or more of the SFGAO values.
psfgaoAttribs : [var] Type: SFGAOF* A bitmap that, when this method returns successfully, contains the values of the requested attributes.
%inst
Gets the attributes of the set of items contained in an
IShellItemArray.

[戻り値]
Type: HRESULT Returns S_OK if the attributes returned exactly match
those requested in sfgaoMask, S_FALSE if the attributes do not
exactly match, or a standard COM error value otherwise.

[備考]
The Shell item array caches individual attributes after they have
been determined. As this method passes through the array gathering
attribute information, it normally stops looking at a particular
attribute after that value is irrevocably set. For instance, if the
SIATTRIBFLAGS_AND flag is set, after an attribute is found not to be
set on an item (a value of 0), there is no need to continue examining
that attribute value on other items because the result of the AND
operation will always be 0. Therefore, the final set of attributes is
commonly calculated by looking at only the first few items in the
array, which is all that is needed to obtain the final value. If you
have a need to examine all items in the array, set the
SIATTRIBFLAGS_ALLITEMS flag. However, be aware that this can slow the
method's return considerably, so do not do so without cause.


%index
IShellItemArray_GetCount
Gets the number of items in the given IShellItem array.
%group
COM misc / IShellItemArray
%prm
this, pdwNumItems
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
pdwNumItems : [int] Type: DWORD* When this method returns, contains the number of items in the IShellItemArray.
%inst
Gets the number of items in the given IShellItem array.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IShellItemArray_GetItemAt
Gets the item at the given index in the IShellItemArray.
%group
COM misc / IShellItemArray
%prm
this, dwIndex, ppsi
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
dwIndex : [int] Type: DWORD The index of the IShellItem requested in the IShellItemArray
ppsi : [comobj] Type: IShellItem** When this method returns, contains the requested IShellItem pointer.
%inst
Gets the item at the given index in the IShellItemArray.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This function returns E_FAIL if the requested index is out of bounds
of the IShellItemArray.


%index
IShellItemArray_EnumItems
Gets an enumerator of the items in the array.
%group
COM misc / IShellItemArray
%prm
this, ppenumShellItems
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
ppenumShellItems : [comobj] Type: IEnumShellItems** When this method returns, contains an IEnumShellItems pointer that enumerates the shell items that are in the array.
%inst
Gets an enumerator of the items in the array.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IShellItemFilter_IncludeItem
Sets a given Shell item status to inclusion in the view.
%group
COM misc / IShellItemFilter
%prm
this, psi
this : [comobj] IShellItemFilter インターフェースの COM オブジェクト変数
psi : [comobj] Type: IShellItem* A pointer to the Shell item that is to be included in the view.
%inst
Sets a given Shell item status to inclusion in the view.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The host calls this method for each item in the folder. Returns S_OK
to have the item enumerated for inclusion in the view. Returns
S_FALSE to prevent the item from being enumerated for inclusion in
the view.


%index
IShellItemFilter_GetEnumFlagsForItem
Allows a client to specify which classes of objects in a Shell item should be enumerated for inclusion in the view.
%group
COM misc / IShellItemFilter
%prm
this, psi, pgrfFlags
this : [comobj] IShellItemFilter インターフェースの COM オブジェクト変数
psi : [comobj] Type: IShellItem* A pointer to the Shell item for which the SHCONTF enum flags are to be retrieved.
pgrfFlags : [int] Type: SHCONTF* A pointer to the SHCONTF enum flags for the given Shell item that specifies which classes of objects to enumerate for inclusion in the view.
%inst
Allows a client to specify which classes of objects in a Shell item
should be enumerated for inclusion in the view.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IShellLinkW_GetPath
Gets the path and file name of the target of a Shell link object. (Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszFile, cch, pfd, fFlags
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszFile : [wstr] Type: LPTSTR The address of a buffer that receives the path and file name of the target of the Shell link object.
cch : [int] Type: int The size, in characters, of the buffer pointed to by the pszFile parameter, including the terminating null character. The maximum path size that can be returned is MAX_PATH. This parameter is commonly set by calling ARRAYSIZE(pszFile). The ARRAYSIZE macro is defined in Winnt.h.
pfd : [var] Type: WIN32_FIND_DATA* A pointer to a WIN32_FIND_DATA structure that receives information about the target of the Shell link object. If this parameter is NULL, then no additional information is returned.
fFlags : [int] Type: DWORD
%inst
Gets the path and file name of the target of a Shell link object.
(Unicode)

[戻り値]
Type: HRESULT Returns S_OK if the operation is successful and a valid
path is retrieved. If the operation is successful but no path is
retrieved, it returns S_FALSE and pszFile will be empty. Otherwise,
it returns one of the standard HRESULT error values.


%index
IShellLinkW_GetIDList
Gets the list of item identifiers for the target of a Shell link object. (Unicode)
%group
COM misc / IShellLinkW
%prm
this, ppidl
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
ppidl : [comobj] Type: PIDLIST_ABSOLUTE* When this method returns, contains the address of a PIDL.
%inst
Gets the list of item identifiers for the target of a Shell link
object. (Unicode)

[戻り値]
Type: HRESULT Returns S_OK if the operation is successful and one or
more valid PIDLs is retrieved. If the operation is successful but no
PIDLs are retrieved, it returns S_FALSE with ppidl set to NULL.
Otherwise, it returns a standard error value.


%index
IShellLinkW_SetIDList
Sets the pointer to an item identifier list (PIDL) for a Shell link object. (Unicode)
%group
COM misc / IShellLinkW
%prm
this, pidl
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pidl : [comobj] Type: PCIDLIST_ABSOLUTE The object's fully qualified PIDL.
%inst
Sets the pointer to an item identifier list (PIDL) for a Shell link
object. (Unicode)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This method is useful when an application needs to set a Shell link
to an object that is not a file, such as a Control Panel application,
a printer, or another computer.


%index
IShellLinkW_GetDescription
Gets the description string for a Shell link object. (Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszName, cch
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszName : [wstr] Type: LPTSTR A pointer to the buffer that receives the description string.
cch : [int] Type: int The maximum number of characters to copy to the buffer pointed to by the pszName parameter.
%inst
Gets the description string for a Shell link object. (Unicode)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
For Windows 2000 or later, the string returned to pszName has a
maximum length of INFOTIPSIZE. For systems prior to Windows 2000, the
size of the string is limited by MAX_PATH.


%index
IShellLinkW_SetDescription
Sets the description for a Shell link object. The description can be any application-defined string. (Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszName
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszName : [wstr] Type: LPCTSTR A pointer to a buffer containing the new description string.
%inst
Sets the description for a Shell link object. The description can be
any application-defined string. (Unicode)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
For Windows 2000 or later, the string specified by pszName must be no
larger than INFOTIPSIZE. For systems prior to Windows 2000, the size
of the string is limited by MAX_PATH.


%index
IShellLinkW_GetWorkingDirectory
Gets the name of the working directory for a Shell link object. (Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszDir, cch
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszDir : [wstr] Type: LPTSTR The address of a buffer that receives the name of the working directory.
cch : [int] Type: int The maximum number of characters to copy to the buffer pointed to by the pszDir parameter. The name of the working directory is truncated if it is longer than the maximum specified by this parameter.
%inst
Gets the name of the working directory for a Shell link object.
(Unicode)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IShellLinkW_SetWorkingDirectory
Sets the name of the working directory for a Shell link object. (Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszDir
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszDir : [wstr] Type: LPCTSTR The address of a buffer that contains the name of the new working directory.
%inst
Sets the name of the working directory for a Shell link object.
(Unicode)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The working directory is optional unless the target requires a
working directory. For example, if an application creates a Shell
link to a Microsoft Word document that uses a template residing in a
different directory, the application would use this method to set the
working directory.


%index
IShellLinkW_GetArguments
Gets the command-line arguments associated with a Shell link object. (Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszArgs, cch
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszArgs : [wstr] Type: LPTSTR A pointer to the buffer that, when this method returns successfully, receives the command-line arguments.
cch : [int] Type: int The maximum number of characters that can be copied to the buffer supplied by the pszArgs parameter. In the case of a Unicode string, there is no limitation on maximum string length. In the case of an ANSI string, the maximum length of the returned string varies depending on the version of Windows?MAX_PATH prior to Windows?2000 and INFOTIPSIZE (defined in Commctrl.h) in Windows?2000 and later.
%inst
Gets the command-line arguments associated with a Shell link object.
(Unicode)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
In Windows 7 and later, it is recommended that you retrieve argument
strings though IPropertyStore (using the PKEY_Link_Arguments value)
rather than this method, which can silently truncate the string if
the provided buffer is not large enough. IPropertyStore allocates a
string of the correct size.


%index
IShellLinkW_SetArguments
Sets the command-line arguments for a Shell link object. (Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszArgs
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszArgs : [wstr] Type: LPCTSTR A pointer to a buffer that contains the new command-line arguments. In the case of a Unicode string, there is no limitation on maximum string length. In the case of an ANSI string, the maximum length of the returned string varies depending on the version of Windows?MAX_PATH prior to Windows?2000 and INFOTIPSIZE (defined in Commctrl.h) in Windows?2000 and later.
%inst
Sets the command-line arguments for a Shell link object. (Unicode)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This method is useful when creating a link to an application that
takes special flags as arguments, such as a compiler.


%index
IShellLinkW_GetHotkey
Gets the keyboard shortcut (hot key) for a Shell link object. (Unicode)
%group
COM misc / IShellLinkW
%prm
this, pwHotkey
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pwHotkey : [int] Type: WORD*
%inst
Gets the keyboard shortcut (hot key) for a Shell link object.
(Unicode)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IShellLinkW_SetHotkey
Sets a keyboard shortcut (hot key) for a Shell link object. (Unicode)
%group
COM misc / IShellLinkW
%prm
this, wHotkey
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
wHotkey : [int] Type: WORD The new keyboard shortcut. The virtual key code is in the low-order byte, and the modifier flags are in the high-order byte. The modifier flags can be a combination of the values specified in the description of the IShellLink::GetHotkey method.
%inst
Sets a keyboard shortcut (hot key) for a Shell link object. (Unicode)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Setting a keyboard shortcut allows the user to activate the object by
pressing a particular combination of keys.


%index
IShellLinkW_GetShowCmd
Gets the show command for a Shell link object. (Unicode)
%group
COM misc / IShellLinkW
%prm
this, piShowCmd
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
piShowCmd : [var] Type: int* A pointer to the command. The following commands are supported.
%inst
Gets the show command for a Shell link object. (Unicode)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The show command is used to set the initial show state of the
corresponding object. This is one of the SW_xxx values described in
ShowWindow.


%index
IShellLinkW_SetShowCmd
Sets the show command for a Shell link object. The show command sets the initial show state of the window. (Unicode)
%group
COM misc / IShellLinkW
%prm
this, iShowCmd
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
iShowCmd : [int] Type: int Command. SetShowCmd accepts one of the following ShowWindow commands.
%inst
Sets the show command for a Shell link object. The show command sets
the initial show state of the window. (Unicode)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IShellLinkW_GetIconLocation
Gets the location (path and index) of the icon for a Shell link object. (Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszIconPath, cch, piIcon
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszIconPath : [wstr] Type: LPTSTR The address of a buffer that receives the path of the file containing the icon.
cch : [int] Type: int The maximum number of characters to copy to the buffer pointed to by the pszIconPath parameter.
piIcon : [int] Type: int* The address of a value that receives the index of the icon.
%inst
Gets the location (path and index) of the icon for a Shell link
object. (Unicode)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IShellLinkW_SetIconLocation
Sets the location (path and index) of the icon for a Shell link object. (Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszIconPath, iIcon
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszIconPath : [wstr] Type: LPCTSTR The address of a buffer to contain the path of the file containing the icon.
iIcon : [int] Type: int The index of the icon.
%inst
Sets the location (path and index) of the icon for a Shell link
object. (Unicode)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IShellLinkW_SetRelativePath
Sets the relative path to the Shell link object. (Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszPathRel, dwReserved
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszPathRel : [wstr] Type: LPCTSTR The address of a buffer that contains the fully-qualified path of the shortcut file, relative to which the shortcut resolution should be performed. It should be a file name, not a folder name.
dwReserved : [int] Type: DWORD Reserved. Set this parameter to zero.
%inst
Sets the relative path to the Shell link object. (Unicode)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Clients commonly define a relative link when it may be moved along
with its target, causing the absolute path to become invalid. The
SetRelativePath method can be used to help the link resolution
process find its target based on a common path prefix between the
target and the relative path. To assist in the resolution process,
clients should set the relative path as part of the link creation
process.


%index
IShellLinkW_Resolve
Attempts to find the target of a Shell link, even if it has been moved or renamed. (Unicode)
%group
COM misc / IShellLinkW
%prm
this, hwnd, fFlags
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
hwnd : [intptr] Type: HWND A handle to the window that the Shell will use as the parent for a dialog box. The Shell displays the dialog box if it needs to prompt the user for more information while resolving a Shell link.
fFlags : [int] Type: DWORD
%inst
Attempts to find the target of a Shell link, even if it has been
moved or renamed. (Unicode)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Following link creation, the name or location of the target may
change. The IShellLink::Resolve method first retrieves the path
associated with the link. If the object is no longer there or has
been renamed, Resolve will attempt to find it. If successful, and the
following conditions are met, the file that the link object was
loaded from will be updated to reflect the new state of the link
object.
This doc was truncated.


%index
IShellLinkW_SetPath
Sets the path and file name for the target of a Shell link object. (Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszFile
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszFile : [wstr] Type: LPCTSTR The address of a buffer that contains the new path.
%inst
Sets the path and file name for the target of a Shell link object.
(Unicode)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IStream_Read
IStream::Read (vtable slot 3)
%group
COM misc / IStream
%prm
this, pv, cb, pcbRead
this : [comobj] IStream インターフェースの COM オブジェクト変数
pv : [intptr] 
cb : [int] 
pcbRead : [var] 
%inst


%index
IStream_Write
IStream::Write (vtable slot 4)
%group
COM misc / IStream
%prm
this, pv, cb, pcbWritten
this : [comobj] IStream インターフェースの COM オブジェクト変数
pv : [intptr] 
cb : [int] 
pcbWritten : [var] 
%inst


%index
IStream_Seek
Changes the seek pointer to a new location. The new location is relative to either the beginning of the stream, the end of the stream, or the current seek pointer.
%group
COM misc / IStream
%prm
this, dlibMove, dwOrigin, plibNewPosition
this : [comobj] IStream インターフェースの COM オブジェクト変数
dlibMove : [int64] The displacement to be added to the location indicated by the dwOrigin parameter. If dwOrigin is STREAM_SEEK_SET, this is interpreted as an unsigned value rather than a signed value.
dwOrigin : [int] The origin for the displacement specified in dlibMove. The origin can be the beginning of the file (STREAM_SEEK_SET), the current seek pointer (STREAM_SEEK_CUR), or the end of the file (STREAM_SEEK_END). For more information about values, see the STREAM_SEEK enumeration.
plibNewPosition : [var] A pointer to the location where this method writes the value of the new seek pointer from the beginning of the stream. You can set this pointer to NULL. In this case, this method does not provide the new seek pointer.
%inst
Changes the seek pointer to a new location. The new location is
relative to either the beginning of the stream, the end of the
stream, or the current seek pointer.

[戻り値]
This method can return one of these values. | Return code |
Description | |----------------|---------------| |S_OK | The seek
pointer was successfully adjusted.| |E_PENDING | Asynchronous Storage
only: Part or all of the stream data is currently unavailable. |
|STG_E_INVALIDPOINTER | Indicates that *plibNewPosition* points to
invalid memory, because *plibNewPosition* is not read.|
|STG_E_INVALIDFUNCTION | The *dwOrigin* parameter contains an invalid
value, or the *dlibMove* parameter contains a bad offset value. For
example, the result of the seek pointer is a negative offset value.|
|STG_E_REVERTED | The object has been invalidated by a revert
operation above it in the transaction tree.|

[備考]
IStream::Seek changes the seek pointer so that subsequent read and
write operations can be performed at a different location in the
stream object. It is an error to seek before the beginning of the
stream. It is not, however, an error to seek past the end of the
stream. Seeking past the end of the stream is useful for subsequent
write operations, as the stream byte range will be extended to the
new seek position immediately before the write is complete. You can
also use this method to obtain the current value of the seek pointer
by calling this method with the dwOrigin parameter set to
STREAM_SEEK_CUR and the dlibMove parameter set to 0 so that the seek
pointer is not changed. The current seek pointer is returned in the
plibNewPosition parameter.


%index
IStream_SetSize
Changes the size of the stream object.
%group
COM misc / IStream
%prm
this, libNewSize
this : [comobj] IStream インターフェースの COM オブジェクト変数
libNewSize : [int64] Specifies the new size, in bytes, of the stream.
%inst
Changes the size of the stream object.

[戻り値]
This method can return one of these values. | Return code |
Description | |----------------|---------------| |S_OK | The size of
the stream object was successfully changed.| |E_PENDING |
Asynchronous Storage only: Part or all of the stream's data is
currently unavailable.| |STG_E_MEDIUMFULL | The stream size is not
changed because there is no space left on the storage device.|
|STG_E_INVALIDFUNCTION | The value of the *libNewSize* parameter is
not supported by the implementation. Not all streams support greater
than 232 bytes. If a stream does not support more than 232 bytes, the
high DWORD data type of *libNewSize* must be zero. If it is nonzero,
the implementation may return STG_E_INVALIDFUNCTION. In general,
COM-based implementations of the IStream interface do not support
streams larger than 232 bytes.| |STG_E_REVERTED | The object has been
invalidated by a revert operation above it in the transaction tree.|

[備考]
IStream::SetSize changes the size of the stream object. Call this
method to preallocate space for the stream. If the libNewSize
parameter is larger than the current stream size, the stream is
extended to the indicated size by filling the intervening space with
bytes of undefined value. This operation is similar to the
ISequentialStream::Write method if the seek pointer is past the
current end of the stream. If the libNewSize parameter is smaller
than the current stream, the stream is truncated to the indicated
size. The seek pointer is not affected by the change in stream size.
Calling IStream::SetSize can be an effective way to obtain a large
chunk of contiguous space.


%index
IStream_CopyTo
Copies a specified number of bytes from the current seek pointer in the stream to the current seek pointer in another stream.
%group
COM misc / IStream
%prm
this, pstm, cb, pcbRead, pcbWritten
this : [comobj] IStream インターフェースの COM オブジェクト変数
pstm : [comobj] A pointer to the destination stream. The stream pointed to by pstm can be a new stream or a clone of the source stream.
cb : [int64] The number of bytes to copy from the source stream.
pcbRead : [var] A pointer to the location where this method writes the actual number of bytes read from the source. You can set this pointer to NULL. In this case, this method does not provide the actual number of bytes read.
pcbWritten : [var] A pointer to the location where this method writes the actual number of bytes written to the destination. You can set this pointer to NULL. In this case, this method does not provide the actual number of bytes written.
%inst
Copies a specified number of bytes from the current seek pointer in
the stream to the current seek pointer in another stream.

[戻り値]
This method can return one of these values. | Return code |
Description | |----------------|---------------| |S_OK | The stream
object was successfully copied.| |E_PENDING | Asynchronous Storage
only: Part or all of the data to be copied is currently unavailable.
| |STG_E_INVALIDPOINTER | The value of one of the pointer parameters
is invalid.| |STG_E_MEDIUMFULL | The stream is not copied because
there is no space left on the storage device.| |STG_E_REVERTED | The
object has been invalidated by a revert operation above it in the
transaction tree.|

[備考]
The CopyTo method copies the specified bytes from one stream to
another. It can also be used to copy a stream to itself. The seek
pointer in each stream instance is adjusted for the number of bytes
read or written. This method is equivalent to reading cb bytes into
memory using ISequentialStream::Read and then immediately writing
them to the destination stream using ISequentialStream::Write,
although IStream::CopyTo will be more efficient. The destination
stream can be a clone of the source stream created by calling the
IStream::Clone method. If IStream::CopyTo returns an error, you
cannot assume that the seek pointers are valid for either the source
or destination. Additionally, the values of pcbRead and pcbWritten
are not meaningful even though they are returned. If IStream::CopyTo
returns successfully, the actual number of bytes read and written are
the same. To copy the remainder of the source from the current seek
pointer, specify the maximum large integer value for the cb
parameter. If the seek pointer is the beginning of the stream, this
operation copies the entire stream.


%index
IStream_Commit
The Commit method ensures that any changes made to a stream object open in transacted mode are reflected in the parent storage.
%group
COM misc / IStream
%prm
this, grfCommitFlags
this : [comobj] IStream インターフェースの COM オブジェクト変数
grfCommitFlags : [int] Controls how the changes for the stream object are committed. See the STGC enumeration for a definition of these values.
%inst
The Commit method ensures that any changes made to a stream object
open in transacted mode are reflected in the parent storage.

[戻り値]
This method can return one of these values. | Return code |
Description | |----------------|---------------| |S_OK | Changes to
the stream object were successfully committed to the parent level.|
|E_PENDING | Asynchronous Storage only: Part or all of the stream's
data is currently unavailable. | |STG_E_MEDIUMFULL | The commit
operation failed due to lack of space on the storage device.|
|STG_E_REVERTED | The object has been invalidated by a revert
operation above it in the transaction tree.|

[備考]
The Commit method ensures that changes to a stream object opened in
transacted mode are reflected in the parent storage. Changes that
have been made to the stream since it was opened or last committed
are reflected to the parent storage object. If the parent is opened
in transacted mode, the parent may revert at a later time, rolling
back the changes to this stream object. The compound file
implementation does not support the opening of streams in transacted
mode, so this method has very little effect other than to flush
memory buffers. For more information, see IStream - Compound File
Implementation. If the stream is open in direct mode, this method
ensures that any memory buffers have been flushed out to the
underlying storage object. This is much like a flush in traditional
file systems. The IStream::Commit method is useful on a direct mode
stream when the implementation of the IStream interface is a wrapper
for underlying file system APIs. In this case, IStream::Commit would
be connected to the file system's flush call.


%index
IStream_Revert
The Revert method discards all changes that have been made to a transacted stream since the last IStream::Commit call. On streams open in direct mode and streams using the COM compound file implementation of IStream::Revert, this method has no effect.
%group
COM misc / IStream
%prm
this
this : [comobj] IStream インターフェースの COM オブジェクト変数
%inst
The Revert method discards all changes that have been made to a
transacted stream since the last IStream::Commit call. On streams
open in direct mode and streams using the COM compound file
implementation of IStream::Revert, this method has no effect.

[戻り値]
This method can return one of these values. | Return code |
Description | |----------------|---------------| |S_OK | The stream
was successfully reverted to its previous version.| |E_PENDING |
Asynchronous Storage only: Part or all of the stream's data is
currently unavailable. |

[備考]
The Revert method discards changes made to a transacted stream since
the last commit operation.


%index
IStream_LockRegion
The LockRegion method restricts access to a specified range of bytes in the stream.
%group
COM misc / IStream
%prm
this, libOffset, cb, dwLockType
this : [comobj] IStream インターフェースの COM オブジェクト変数
libOffset : [int64] Integer that specifies the byte offset for the beginning of the range.
cb : [int64] Integer that specifies the length of the range, in bytes, to be restricted.
dwLockType : [int] Specifies the restrictions being requested on accessing the range.
%inst
The LockRegion method restricts access to a specified range of bytes
in the stream.

[戻り値]
This method can return one of these values. | Return code |
Description | |----------------|---------------| |S_OK | The
specified range of bytes was locked.| |E_PENDING | Asynchronous
Storage only: Part or all of the stream's data is currently
unavailable. | |STG_E_INVALIDFUNCTION | Locking is not supported at
all or the specific type of lock requested is not supported.|
|STG_E_LOCKVIOLATION | Requested lock is supported, but cannot be
granted because of an existing lock.| |STG_E_REVERTED | The object
has been invalidated by a revert operation above it in the
transaction tree.|

[備考]
The byte range of the stream can be extended. Locking an extended
range for the stream is useful as a method of communication between
different instances of the stream without changing data that is
actually part of the stream. Three types of locking can be supported:
locking to exclude other writers, locking to exclude other readers or
writers, and locking that allows only one requester to obtain a lock
on the given range, which is usually an alias for one of the other
two lock types. A given stream instance might support either of the
first two types, or both. The lock type is specified by dwLockType,
using a value from the LOCKTYPE enumeration. Any region locked with
IStream::LockRegion must later be explicitly unlocked by calling
IStream::UnlockRegion with exactly the same values for the libOffset,
cb, and dwLockType parameters. The region must be unlocked before the
stream is released. Two adjacent regions cannot be locked separately
and then unlocked with a single unlock call. Notes to Callers Since
the type of locking supported is optional and can vary in different
implementations of IStream, you must provide code to deal with the
STG_E_INVALIDFUNCTION error. The LockRegion method has no effect in
the compound file implementation, because the implementation does not
support range locking. Notes to Implementers Support for this method
is optional for implementations of stream objects since it may not be
supported by the underlying file system. The type of locking
supported is also optional. The STG_E_INVALIDFUNCTION error is
returned if the requested type of locking is not supported.


%index
IStream_UnlockRegion
The UnlockRegion method removes the access restriction on a range of bytes previously restricted with IStream::LockRegion.
%group
COM misc / IStream
%prm
this, libOffset, cb, dwLockType
this : [comobj] IStream インターフェースの COM オブジェクト変数
libOffset : [int64] Specifies the byte offset for the beginning of the range.
cb : [int64] Specifies, in bytes, the length of the range to be restricted.
dwLockType : [int] Specifies the access restrictions previously placed on the range.
%inst
The UnlockRegion method removes the access restriction on a range of
bytes previously restricted with IStream::LockRegion.

[戻り値]
This method can return one of these values. | Return code |
Description | |----------------|---------------| |S_OK | The byte
range was unlocked.| |E_PENDING | Asynchronous Storage only: Part or
all of the stream's data is currently unavailable.|
|STG_E_INVALIDFUNCTION | Locking is not supported at all or the
specific type of lock requested is not supported.|
|STG_E_LOCKVIOLATION | The requested unlock operation cannot be
granted.| |STG_E_REVERTED | The object has been invalidated by a
revert operation above it in the transaction tree.|

[備考]
IStream::UnlockRegion unlocks a region previously locked with the
IStream::LockRegion method. Locked regions must later be explicitly
unlocked by calling IStream::UnlockRegion with exactly the same
values for the libOffset, cb, and dwLockType parameters. The region
must be unlocked before the stream is released. Two adjacent regions
cannot be locked separately and then unlocked with a single unlock
call.


%index
IStream_Stat
The Stat method retrieves the STATSTG structure for this stream.
%group
COM misc / IStream
%prm
this, pstatstg, grfStatFlag
this : [comobj] IStream インターフェースの COM オブジェクト変数
pstatstg : [var] Pointer to a STATSTG structure where this method places information about this stream object.
grfStatFlag : [int] Specifies that this method does not return some of the members in the STATSTG structure, thus saving a memory allocation operation. Values are taken from the STATFLAG enumeration.
%inst
The Stat method retrieves the STATSTG structure for this stream.

[戻り値]
This method can return one of these values. | Return code |
Description | |----------------|---------------| |S_OK | The STATSTG
structure was successfully returned at the specified location.|
|E_PENDING | Asynchronous Storage only: Part or all of the stream's
data is currently unavailable. | |STG_E_ACCESSDENIED | The caller
does not have enough permissions for accessing statistics for this
storage object.| |STG_E_INSUFFICIENTMEMORY | The STATSTG structure
was not returned due to a lack of memory.| |STG_E_INVALIDFLAG | The
value for the *grfStateFlag* parameter is not valid.|
|STG_E_INVALIDPOINTER | The *pStatStg* pointer is not valid.|
|STG_E_REVERTED | The object has been invalidated by a revert
operation above it in the transaction tree.|

[備考]
IStream::Stat retrieves a pointer to the STATSTG structure that
contains information about this open stream. When this stream is
within a structured storage and IStorage::EnumElements is called, it
creates an enumerator object with the IEnumSTATSTG interface on it,
which can be called to enumerate the storages and streams through the
STATSTG structures associated with each of them.


%index
IStream_Clone
The Clone method creates a new stream object with its own seek pointer that references the same bytes as the original stream.
%group
COM misc / IStream
%prm
this, ppstm
this : [comobj] IStream インターフェースの COM オブジェクト変数
ppstm : [comobj] When successful, pointer to the location of an IStream pointer to the new stream object. If an error occurs, this parameter is NULL.
%inst
The Clone method creates a new stream object with its own seek
pointer that references the same bytes as the original stream.

[戻り値]
This method can return one of these values. | Return code |
Description | |----------------|---------------| |S_OK | The stream
was successfully cloned.| |E_PENDING | Asynchronous Storage only:
Part or all of the stream's data is currently unavailable. |
|STG_E_INSUFFICIENTMEMORY | The stream was not cloned due to a lack
of memory.| |STG_E_INVALIDPOINTER | The ppStm pointer is not valid.|
|STG_E_REVERTED | The object has been invalidated by a revert
operation above it in the transaction tree.|

[備考]
The Clone method creates a new stream object for accessing the same
bytes but using a separate seek pointer. The new stream object sees
the same data as the source-stream object. Changes written to one
object are immediately visible in the other. Range locking is shared
between the stream objects. The initial setting of the seek pointer
in the cloned stream instance is the same as the current setting of
the seek pointer in the original stream at the time of the clone
operation.

