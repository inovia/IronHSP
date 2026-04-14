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
バインドコンテキストが解放されるまでオブジェクトがアクティブのまま保たれるよう、そのオブジェクトをバインドコンテキストに登録する。
%group
COM misc / IBindCtx
%prm
this, punk
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
punk : [int] バインド済みとして登録するオブジェクトの IUnknown インターフェースへのポインター。
%inst
バインドコンテキストが解放されるまでオブジェクトがアクティブのまま保たれるよう、そのオブジェクトをバインドコンテキストに登録する。

[戻り値]
このメソッドは標準の戻り値 E_OUTOFMEMORY および S_OK を返すことがある。

[備考]
新しいモニカクラスを作成する場合（IMoniker
インターフェースの実装を通じて）、実装がオブジェクトをアクティブ化したときは常にこのメソッドを呼び出すべきである。これはモニカのバインド過程で最もよく発生するが、モニカの表示名の取得、表示名からモニカへの解析、オブジェクトの最終変更時刻の取得中にも起こり得る。RegisterObjectBound
はオブジェクトに対する追加の参照を作成するために AddRef
を呼び出す。ただし自身のポインターは別途解放する必要がある。同じオブジェクトに対してこのメソッドを 2
回呼び出すと、そのオブジェクトへの参照が 2 つ作成される。このメソッドの呼び出しで取得した参照は
IBindCtx::RevokeObjectBound
を呼び出して解放できる。バインドコンテキスト自身が解放されると、そのバインドコンテキストが保持していたすべての参照が解放される。RegisterObjectBound
でオブジェクトをバインドコンテキストに登録すると、バインドコンテキストが解放されるまでそのオブジェクトはアクティブ状態に保たれる。同じバインドコンテキストを後続のバインド操作で（同じ複合モニカの別の部分に対して、あるいは異なるモニカに対して）再利用すると、そのオブジェクトを再読み込みする必要がなくなるためバインド操作を効率化できる。ただしこれは後続のバインド操作が元の操作と同じオブジェクトを必要とする場合にのみ性能向上につながるため、バインドコンテキスト再利用による性能向上と不要にオブジェクトをアクティブのまま保持するコストを比較検討する必要がある。
IBindCtx は RegisterObjectBound
で登録されたオブジェクトへのポインターを取得するメソッドを提供しない。オブジェクトがランニングオブジェクトテーブルに自身を登録していれば、モニカ実装は
IRunningObjectTable::GetObject を呼び出してオブジェクトへのポインターを取得できる。


%index
IBindCtx_RevokeObjectBound
RegisterObjectBound の呼び出しを取り消し、バインドコンテキストからオブジェクトを削除する。
%group
COM misc / IBindCtx
%prm
this, punk
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
punk : [int] 削除するオブジェクトの IUnknown インターフェースへのポインター。
%inst
RegisterObjectBound の呼び出しを取り消し、バインドコンテキストからオブジェクトを削除する。

[戻り値]
このメソッドは以下の値を返すことがある。
（以下省略）

[備考]
このメソッドを呼び出すことはほとんどない。主として完全性のためにドキュメント化されている。


%index
IBindCtx_ReleaseBoundObjects
RegisterObjectBound の呼び出しで以前に登録されたすべてのオブジェクトへのポインターを解放する。
%group
COM misc / IBindCtx
%prm
this
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
%inst
RegisterObjectBound の呼び出しで以前に登録されたすべてのオブジェクトへのポインターを解放する。

[戻り値]
成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
このメソッドを直接呼び出すことはほとんどない。システムの IBindCtx 実装は、バインドコンテキストの IBindCtx
インターフェースへのポインターが解放されるとき（バインドコンテキストが解放されるとき）にこのメソッドを呼び出す。バインドコンテキストが解放されなかった場合、登録されたすべてのオブジェクトはアクティブのままとなる。同じオブジェクトが複数回登録されている場合、このメソッドは登録回数分だけそのオブジェクトの
Release メソッドを呼び出す。


%index
IBindCtx_SetBindOptions
バインドコンテキストに格納されているバインドパラメーターに新しい値を設定する。
%group
COM misc / IBindCtx
%prm
this, pbindopts
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
pbindopts : [var] バインドパラメーターを含む [BIND_OPTS3](/windows/win32/api/objidl/ns-objidl-bind_opts3-r1) 構造体へのポインター。
%inst
バインドコンテキストに格納されているバインドパラメーターに新しい値を設定する。

[戻り値]
このメソッドは標準の戻り値 E_OUTOFMEMORY および S_OK を返すことがある。

[備考]
バインドコンテキストには、ほとんどの IMoniker
操作に共通のパラメーターのブロックが含まれる。これらのパラメーターは複合モニカの各部分を処理する過程でも変化しない。後続のバインド操作は
IBindCtx::GetBindOptions を呼び出してこれらのパラメーターを取得できる。呼び出し側へのメモ
このメソッドはモニカクライアント（モニカを使ってオブジェクトへのインターフェースポインターを取得する側）から呼び出されることがある。CreateBindCtx
関数を使ってバインドコンテキストを初めて作成するとき、BIND_OPTS 構造体のフィールドは以下の値に初期化される。
（以下省略）


%index
IBindCtx_GetBindOptions
このバインドコンテキストに格納されているバインドオプションを取得する。
%group
COM misc / IBindCtx
%prm
this, pbindopts
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
pbindopts : [var] 戻り時に現在のバインドパラメーターを受け取る初期化済み構造体へのポインター。[BIND_OPTS3](/windows/win32/api/objidl/ns-objidl-bind_opts3-r1) を参照。
%inst
このバインドコンテキストに格納されているバインドオプションを取得する。

[戻り値]
このメソッドは標準の戻り値 E_UNEXPECTED および S_OK を返すことがある。

[備考]
バインドコンテキストには、ほとんどの IMoniker
操作に共通で、複合モニカの各部分を処理する過程でも変化しないパラメーターのブロックが含まれる。呼び出し側へのメモ
独自のモニカクラスを作成する場合、通常このメソッドを呼び出す（IMoniker
インターフェースの実装が必要）。モニカクライアントによって指定されたパラメーターを取得するために呼び出す。このメソッドによって設定される構造体は初期化しておかなければならない。呼び出し前に
cbStruct メンバーを構造体のサイズに初期化しておく必要がある。


%index
IBindCtx_GetRunningObjectTable
このバインドコンテキストが動作しているコンピューターのランニングオブジェクトテーブル (ROT) へのインターフェースポインターを取得する。
%group
COM misc / IBindCtx
%prm
this, pprot
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
pprot : [comobj] ランニングオブジェクトテーブルへのインターフェースポインターを受け取る IRunningObjectTable* ポインター変数のアドレス。エラーが発生した場合 *pprot は NULL に設定される。*pprot が非 NULL の場合、実装はランニングテーブルオブジェクトに対して AddRef を呼び出す。Release を呼び出す責任は呼び出し側にある。
%inst
このバインドコンテキストが動作しているコンピューターのランニングオブジェクトテーブル (ROT)
へのインターフェースポインターを取得する。

[戻り値]
このメソッドは標準の戻り値 E_OUTOFMEMORY、E_UNEXPECTED、および S_OK を返すことがある。

[備考]
ランニングオブジェクトテーブル (ROT)
は各コンピューター上でグローバルにアクセス可能なテーブルで、現在実行中のオブジェクトをすべて追跡する。呼び出し側へのメモ
通常、新しいモニカクラスを実装する側（IMoniker
の実装を通じて）がこのメソッドを呼び出す。IMoniker::BindToObject や IMoniker::IsRunning
の実装内でオブジェクトが現在実行中かどうかを確認するのに便利である。また IMoniker::GetTimeOfLastChange
の実装内で、実行中オブジェクトが最後に変更された時刻を取得するためにも利用できる。モニカ実装では
GetRunningObjectTable 関数を使わずにこのメソッドを呼び出すべきである。これにより将来の IBindCtx
実装がバインド動作を変更する余地が残る。


%index
IBindCtx_RegisterObjectParam
バインドコンテキストの文字列キー付きポインターテーブルで、オブジェクトを文字列キーに関連付ける。
%group
COM misc / IBindCtx
%prm
this, pszKey, punk
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
pszKey : [wstr] オブジェクトを登録するバインドコンテキスト文字列キー。キー文字列の比較は大文字と小文字を区別する。
punk : [int] 登録するオブジェクトの IUnknown インターフェースへのポインター。メソッドはこのポインターに対して AddRef を呼び出す。
%inst
バインドコンテキストの文字列キー付きポインターテーブルで、オブジェクトを文字列キーに関連付ける。

[戻り値]
このメソッドは標準の戻り値 E_OUTOFMEMORY および S_OK を返すことがある。

[備考]

バインドコンテキストはインターフェースポインターのテーブルを保持し、それぞれが文字列キーに関連付けられている。これによりモニカ実装とバインド操作を開始した呼び出し側との間で通信が可能になる。一方がインターフェースポインターを双方で既知の文字列で格納しておけば、もう一方が後でバインドコンテキストから取り出すことができる。このメソッドを使用した後のバインド操作は
IBindCtx::GetObjectParam を使って格納されたポインターを取得できる。呼び出し側へのメモ
RegisterObjectParam は新しいモニカクラスを実装する側（IMoniker
の実装を通じて）とモニカクライアント（モニカを使ってオブジェクトへバインドする側）の双方に有用である。新しいモニカクラスを実装する際、モニカバインド中にエラーが発生した場合にエラーの原因を呼び出し側に通知するためにこのメソッドを呼び出す。このメソッドで使用するキーはエラー条件に依存する。以下によくあるモニカバインドエラーと、それぞれに適したキーを挙げる。
（以下省略）


%index
IBindCtx_GetObjectParam
バインドコンテキストの文字列キー付きポインターテーブルで、指定キーに関連付けられたオブジェクトへのインターフェースポインターを取得する。
%group
COM misc / IBindCtx
%prm
this, pszKey, ppunk
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
pszKey : [wstr] 検索対象のバインドコンテキスト文字列キー。キー文字列の比較は大文字と小文字を区別する。
ppunk : [int] pszKey に関連付けられたオブジェクトへのインターフェースポインターを受け取る IUnknown* ポインター変数のアドレス。成功時、実装は *ppunk に対して AddRef を呼び出す。Release を呼び出す責任は呼び出し側にある。エラーが発生した場合、実装は *ppunk を NULL に設定する。
%inst
バインドコンテキストの文字列キー付きポインターテーブルで、指定キーに関連付けられたオブジェクトへのインターフェースポインターを取得する。

[戻り値]
メソッドが成功した場合、戻り値は S_OK。そうでなければ E_FAIL。

[備考]

バインドコンテキストはインターフェースポインターのテーブルを保持し、それぞれが文字列キーに関連付けられている。これによりモニカ実装とバインド操作を開始した呼び出し側との間で通信が可能になる。このメソッドで取得できるポインターは、事前に
IBindCtx::RegisterObjectParam メソッドを使ってテーブルに挿入されている必要がある。呼び出し側へのメモ
他のオブジェクトを探すためにモニカを使用しているオブジェクトは、バインド操作に失敗したときにこのメソッドを呼び出して発生したエラーの具体的情報を取得できる。エラー内容によっては状況を修正してバインド操作を再試行することも可能である。詳細は
IBindCtx::RegisterObjectParam
を参照。モニカ実装では、呼び出し側がバインド操作を開始して具体的な情報を要求する状況を処理するためにこのメソッドを呼び出すことができる。慣例として、実装者はモニカクラスの
CLSID の文字列形式で始まるキー名を使用するべきである（StringFromCLSID 関数を参照）。


%index
IBindCtx_EnumObjectParam
バインドコンテキストの文字列キー付きポインターテーブルのキーを列挙するためのインターフェースへのポインターを取得する。
%group
COM misc / IBindCtx
%prm
this, ppenum
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
ppenum : [comobj] 列挙子へのインターフェースポインターを受け取る IEnumString* ポインター変数のアドレス。エラーが発生した場合 *ppenum は NULL に設定される。*ppenum が非 NULL の場合、実装は *ppenum に対して AddRef を呼び出す。Release を呼び出す責任は呼び出し側にある。
%inst
バインドコンテキストの文字列キー付きポインターテーブルのキーを列挙するためのインターフェースへのポインターを取得する。

[戻り値]
このメソッドは標準の戻り値 E_OUTOFMEMORY および S_OK を返すことがある。

[備考]
列挙子が返すキーは、IBindCtx::RegisterObjectParam
への呼び出しで以前に指定されたものである。呼び出し側へのメモ
バインドコンテキストはインターフェースポインターのテーブルを保持し、それぞれが文字列キーに関連付けられている。これによりモニカ実装とバインド操作を開始した呼び出し側との間で通信が可能になる。一方がインターフェースポインターを双方で既知の文字列で格納しておけば、もう一方が後でバインドコンテキストから取り出すことができる。IBindCtx
インターフェースのシステム実装では、このメソッドは実装されていない。したがってこのメソッドを呼び出すと戻り値 E_NOTIMPL が返る。


%index
IBindCtx_RevokeObjectParam
バインドコンテキストの文字列キー付きオブジェクトテーブルから、指定キーとそれに関連付けられたポインターを削除する。このキーは事前に RegisterObjectParam の呼び出しでテーブルに挿入されている必要がある。
%group
COM misc / IBindCtx
%prm
this, pszKey
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
pszKey : [wstr] 削除するバインドコンテキスト文字列キー。キー文字列の比較は大文字と小文字を区別する。
%inst
バインドコンテキストの文字列キー付きオブジェクトテーブルから、指定キーとそれに関連付けられたポインターを削除する。このキーは事前に
RegisterObjectParam の呼び出しでテーブルに挿入されている必要がある。

[戻り値]
このメソッドは以下の値を返すことがある。
（以下省略）

[備考]

バインドコンテキストはインターフェースポインターのテーブルを保持し、それぞれが文字列キーに関連付けられている。これによりモニカ実装とバインド操作を開始した呼び出し側との間で通信が可能になる。一方がインターフェースポインターを双方で既知の文字列で格納しておけば、もう一方が後でバインドコンテキストから取り出すことができる。このメソッドはテーブルからエントリーを削除するために使用する。指定キーが見つかった場合、バインドコンテキストはそのオブジェクトへの参照も解放する。


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
ID2D1Bitmap_GetFactory
ID2D1Bitmap::GetFactory (vtable slot 3)
%group
COM misc / ID2D1Bitmap
%prm
this, factory
this : [comobj] ID2D1Bitmap インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1Bitmap_GetSize
デバイス非依存ピクセル (DIP) 単位でのビットマップのサイズを返す。
%group
COM misc / ID2D1Bitmap
%prm
this
this : [comobj] ID2D1Bitmap インターフェースの COM オブジェクト変数
%inst
デバイス非依存ピクセル (DIP) 単位でのビットマップのサイズを返す。

[戻り値]
型: D2D1_SIZE_F ビットマップのサイズ（DIP 単位）。

[備考]
DIP は 1/96 インチである。デバイスピクセル単位のサイズを取得するには ID2D1Bitmap::GetPixelSize
メソッドを使用する。


%index
ID2D1Bitmap_GetPixelSize
デバイス依存単位（ピクセル）でのビットマップのサイズを返す。
%group
COM misc / ID2D1Bitmap
%prm
this
this : [comobj] ID2D1Bitmap インターフェースの COM オブジェクト変数
%inst
デバイス依存単位（ピクセル）でのビットマップのサイズを返す。

[戻り値]
型: D2D1_SIZE_U ビットマップのサイズ（ピクセル単位）。


%index
ID2D1Bitmap_GetPixelFormat
ビットマップのピクセル形式とアルファモードを取得する。
%group
COM misc / ID2D1Bitmap
%prm
this
this : [comobj] ID2D1Bitmap インターフェースの COM オブジェクト変数
%inst
ビットマップのピクセル形式とアルファモードを取得する。

[戻り値]
型: D2D1_PIXEL_FORMAT ビットマップのピクセル形式とアルファモード。


%index
ID2D1Bitmap_GetDpi
ビットマップの DPI (dots per inch) を返す。
%group
COM misc / ID2D1Bitmap
%prm
this, dpiX, dpiY
this : [comobj] ID2D1Bitmap インターフェースの COM オブジェクト変数
dpiX : [float] 型: FLOAT* 画像の水平 DPI。このパラメーターの格納領域は呼び出し側が確保する必要がある。
dpiY : [float] 型: FLOAT* 画像の垂直 DPI。このパラメーターの格納領域は呼び出し側が確保する必要がある。
%inst
ビットマップの DPI (dots per inch) を返す。


%index
ID2D1Bitmap_CopyFromBitmap
指定したビットマップから指定した領域を現在のビットマップにコピーする。
%group
COM misc / ID2D1Bitmap
%prm
this, destPoint, bitmap, srcRect
this : [comobj] ID2D1Bitmap インターフェースの COM オブジェクト変数
destPoint : [var] 型: const D2D1_POINT_2U* 現在のビットマップ内で、srcRect で指定された領域のコピー先となる左上隅。
bitmap : [comobj] 型: ID2D1Bitmap* コピー元のビットマップ。
srcRect : [var] 型: const D2D1_RECT_U* コピー元ビットマップ内のコピーする領域。
%inst
指定したビットマップから指定した領域を現在のビットマップにコピーする。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]

このメソッドは現在のビットマップのサイズを更新しない。コピー元ビットマップの内容が現在のビットマップに収まらない場合、このメソッドは失敗する。またこのメソッドは形式変換を行わないため、ビットマップの形式が一致しない場合は失敗する。ビットマップが現在のバッチでアクティブな場合、このメソッドの呼び出しによって現在のバッチがフラッシュされることがある。フラッシュされたバッチが正常に完了しなかった場合、このメソッドは失敗する。ただしバッチがフラッシュされたレンダーターゲットのエラー状態はクリアされない。失敗した
HRESULT とタグ状態は次の EndDraw または Flush の呼び出し時に返される。Windows 8.1
以降、このメソッドはブロック圧縮ビットマップをサポートする。ブロック圧縮形式を使用する場合、srcRect パラメーターの終端座標は 4
の倍数でなければならず、そうでない場合は E_INVALIDARG を返す。


%index
ID2D1Bitmap_CopyFromRenderTarget
指定したレンダーターゲットの指定領域を現在のビットマップにコピーする。
%group
COM misc / ID2D1Bitmap
%prm
this, destPoint, renderTarget, srcRect
this : [comobj] ID2D1Bitmap インターフェースの COM オブジェクト変数
destPoint : [var] 型: const D2D1_POINT_2U* 現在のビットマップ内で、srcRect で指定された領域のコピー先となる左上隅。
renderTarget : [comobj] 型: ID2D1RenderTarget* コピー元領域を含むレンダーターゲット。
srcRect : [var] 型: const D2D1_RECT_U* renderTarget 内のコピーする領域。
%inst
指定したレンダーターゲットの指定領域を現在のビットマップにコピーする。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]

このメソッドは現在のビットマップのサイズを更新しない。コピー元ビットマップの内容が現在のビットマップに収まらない場合、このメソッドは失敗する。またこのメソッドは形式変換を行わないため、ビットマップの形式が一致しない場合は失敗する。ビットマップが現在のバッチでアクティブな場合、このメソッドの呼び出しによって現在のバッチがフラッシュされることがある。フラッシュされたバッチが正常に完了しなかった場合、このメソッドは失敗する。ただしバッチがフラッシュされたレンダーターゲットのエラー状態はクリアされない。失敗した
HRESULT とタグ状態は次の EndDraw または Flush
の呼び出し時に返される。このメソッドを呼び出す前に、すべてのクリップとレイヤーをレンダーターゲットからポップしておく必要がある。レンダーターゲットにクリップまたはレイヤーが適用されている場合、メソッドは
D2DERR_RENDER_TARGET_HAS_LAYER_OR_CLIPRECT を返す。


%index
ID2D1Bitmap_CopyFromMemory
メモリ上の指定領域を現在のビットマップにコピーする。
%group
COM misc / ID2D1Bitmap
%prm
this, dstRect, srcData, pitch
this : [comobj] ID2D1Bitmap インターフェースの COM オブジェクト変数
dstRect : [var] 型: const D2D1_RECT_U* 現在のビットマップ内で、srcRect で指定された領域のコピー先となる矩形。
srcData : [intptr] 型: const void* コピーするデータ。
pitch : [int] 型: UINT32 srcData に格納されたコピー元ビットマップのストライド（ピッチ）。ストライドとはスキャンライン（メモリ上のピクセル 1 行）のバイト数である。ストライドは「ピクセル幅 * ピクセルあたりのバイト数 + メモリパディング」で算出できる。
%inst
メモリ上の指定領域を現在のビットマップにコピーする。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]

このメソッドは現在のビットマップのサイズを更新しない。コピー元ビットマップの内容が現在のビットマップに収まらない場合、このメソッドは失敗する。またこのメソッドは形式変換を行わないため、2
つのビットマップの形式は一致している必要がある。このメソッドに無効な入力（無効なコピー先矩形など）を渡すと、歪んだ画像やデバイス障害など予測不能な結果を生じることがある。ビットマップが現在のバッチでアクティブな場合、このメソッドの呼び出しによって現在のバッチがフラッシュされることがある。フラッシュされたバッチが正常に完了しなかった場合、このメソッドは失敗する。ただしバッチがフラッシュされたレンダーターゲットのエラー状態はクリアされない。失敗した
HRESULT とタグ状態は次の EndDraw または Flush の呼び出し時に返される。Windows 8.1
以降、このメソッドはブロック圧縮ビットマップをサポートする。ブロック圧縮形式を使用する場合、srcRect パラメーターの終端座標は 4
の倍数でなければならず、そうでない場合は E_INVALIDARG を返す。


%index
ID2D1BitmapBrush_GetFactory
ID2D1BitmapBrush::GetFactory (vtable slot 3)
%group
COM misc / ID2D1BitmapBrush
%prm
this, factory
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1BitmapBrush_SetOpacity
ID2D1BitmapBrush::SetOpacity (vtable slot 4)
%group
COM misc / ID2D1BitmapBrush
%prm
this, opacity
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
opacity : [float] 
%inst


%index
ID2D1BitmapBrush_SetTransform
ID2D1BitmapBrush::SetTransform (vtable slot 5)
%group
COM misc / ID2D1BitmapBrush
%prm
this, transform
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1BitmapBrush_GetOpacity
ID2D1BitmapBrush::GetOpacity (vtable slot 6)
%group
COM misc / ID2D1BitmapBrush
%prm
this
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
%inst


%index
ID2D1BitmapBrush_GetTransform
ID2D1BitmapBrush::GetTransform (vtable slot 7)
%group
COM misc / ID2D1BitmapBrush
%prm
this, transform
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1BitmapBrush_SetExtendModeX
Specifies how the brush horizontally tiles those areas that extend past its bitmap.
%group
COM misc / ID2D1BitmapBrush
%prm
this, extendModeX
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
extendModeX : [int] Type: D2D1_EXTEND_MODE A value that specifies how the brush horizontally tiles those areas that extend past its bitmap.
%inst
Specifies how the brush horizontally tiles those areas that extend
past its bitmap.

[備考]
Sometimes, the bitmap for a bitmap brush doesn't completely fill the
area being painted. When this happens, Direct2D uses the brush's
horizontal (SetExtendModeX) and vertical (SetExtendModeY) extend mode
settings to determine how to fill the remaining area. The following
illustration shows the results from every possible combination of the
extend modes for an ID2D1BitmapBrush: D2D1_EXTEND_MODE_CLAMP (CLAMP),
D2D1_EXTEND_MODE_WRAP (WRAP), and D2D1_EXTEND_MIRROR (MIRROR).
This doc was truncated.


%index
ID2D1BitmapBrush_SetExtendModeY
Specifies how the brush vertically tiles those areas that extend past its bitmap.
%group
COM misc / ID2D1BitmapBrush
%prm
this, extendModeY
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
extendModeY : [int] Type: D2D1_EXTEND_MODE A value that specifies how the brush vertically tiles those areas that extend past its bitmap.
%inst
Specifies how the brush vertically tiles those areas that extend past
its bitmap.

[備考]
Sometimes, the bitmap for a bitmap brush doesn't completely fill the
area being painted. When this happens, Direct2D uses the brush's
horizontal (SetExtendModeX) and vertical (SetExtendModeY) extend mode
settings to determine how to fill the remaining area. The following
illustration shows the results from every possible combination of the
extend modes for an ID2D1BitmapBrush: D2D1_EXTEND_MODE_CLAMP (CLAMP),
D2D1_EXTEND_MODE_WRAP (WRAP), and D2D1_EXTEND_MIRROR (MIRROR).
This doc was truncated.


%index
ID2D1BitmapBrush_SetInterpolationMode
Specifies the interpolation mode used when the brush bitmap is scaled or rotated.
%group
COM misc / ID2D1BitmapBrush
%prm
this, interpolationMode
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
interpolationMode : [int] Type: D2D1_BITMAP_INTERPOLATION_MODE The interpolation mode used when the brush bitmap is scaled or rotated.
%inst
Specifies the interpolation mode used when the brush bitmap is scaled
or rotated.

[備考]
This method sets the interpolation mode for a bitmap, which is an
enum value that is specified in the D2D1_BITMAP_INTERPOLATION_MODE
enumeration type. D2D1_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR
represents nearest neighbor filtering. It looks up the nearest bitmap
pixel to the current rendering pixel and chooses its exact color.
D2D1_BITMAP_INTERPOLATION_MODE_LINEAR represents linear filtering,
and interpolates a color from the four nearest bitmap pixels. The
interpolation mode of a bitmap also affects subpixel translations. In
a subpixel translation, bilinear interpolation positions the bitmap
more precisely to the application requests, but blurs the bitmap in
the process.


%index
ID2D1BitmapBrush_SetBitmap
Specifies the bitmap source that this brush uses to paint.
%group
COM misc / ID2D1BitmapBrush
%prm
this, bitmap
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
bitmap : [comobj] Type: ID2D1Bitmap* The bitmap source used by the brush.
%inst
Specifies the bitmap source that this brush uses to paint.

[備考]
This method specifies the bitmap source that this brush uses to
paint. The bitmap is not resized or rescaled automatically to fit the
geometry that it fills. The bitmap stays at its native size. To
resize or translate the bitmap, use the SetTransform method to apply
a transform to the brush. The native size of a bitmap is the width
and height in bitmap pixels, divided by the bitmap DPI. This native
size forms the base tile of the brush. To tile a subregion of the
bitmap, you must generate a new bitmap containing this subregion and
use SetBitmap to apply it to the brush.


%index
ID2D1BitmapBrush_GetExtendModeX
Gets the method by which the brush horizontally tiles those areas that extend past its bitmap.
%group
COM misc / ID2D1BitmapBrush
%prm
this
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
%inst
Gets the method by which the brush horizontally tiles those areas
that extend past its bitmap.

[戻り値]
Type: D2D1_EXTEND_MODE A value that specifies how the brush
horizontally tiles those areas that extend past its bitmap.

[備考]
Like all brushes, ID2D1BitmapBrush defines an infinite plane of
content. Because bitmaps are finite, it relies on an extend mode to
determine how the plane is filled horizontally and vertically.


%index
ID2D1BitmapBrush_GetExtendModeY
Gets the method by which the brush vertically tiles those areas that extend past its bitmap.
%group
COM misc / ID2D1BitmapBrush
%prm
this
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
%inst
Gets the method by which the brush vertically tiles those areas that
extend past its bitmap.

[戻り値]
Type: D2D1_EXTEND_MODE A value that specifies how the brush
vertically tiles those areas that extend past its bitmap.

[備考]
Like all brushes, ID2D1BitmapBrush defines an infinite plane of
content. Because bitmaps are finite, it relies on an extend mode to
determine how the plane is filled horizontally and vertically.


%index
ID2D1BitmapBrush_GetInterpolationMode
Gets the interpolation method used when the brush bitmap is scaled or rotated.
%group
COM misc / ID2D1BitmapBrush
%prm
this
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
%inst
Gets the interpolation method used when the brush bitmap is scaled or
rotated.

[戻り値]
Type: D2D1_BITMAP_INTERPOLATION_MODE The interpolation method used
when the brush bitmap is scaled or rotated.

[備考]
This method gets the interpolation mode of a bitmap, which is
specified by the D2D1_BITMAP_INTERPOLATION_MODE enumeration type.
D2D1_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR represents nearest
neighbor filtering. It looks up the bitmap pixel nearest to the
current rendering pixel and chooses its exact color.
D2D1_BITMAP_INTERPOLATION_MODE_LINEAR represents linear filtering,
and interpolates a color from the four nearest bitmap pixels. The
interpolation mode of a bitmap also affects subpixel translations. In
a subpixel translation, linear interpolation positions the bitmap
more precisely to the application request, but blurs the bitmap in
the process.


%index
ID2D1BitmapBrush_GetBitmap
Gets the bitmap source that this brush uses to paint.
%group
COM misc / ID2D1BitmapBrush
%prm
this, bitmap
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
bitmap : [comobj] Type: ID2D1Bitmap** When this method returns, contains the address to a pointer to the bitmap with which this brush paints.
%inst
Gets the bitmap source that this brush uses to paint.


%index
ID2D1BitmapRenderTarget_GetFactory
ID2D1BitmapRenderTarget::GetFactory (vtable slot 3)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, factory
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateBitmap
ID2D1BitmapRenderTarget::CreateBitmap (vtable slot 4)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, size, srcData, pitch, bitmapProperties, bitmap
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
size : [int] 
srcData : [intptr] 
pitch : [int] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateBitmapFromWicBitmap
ID2D1BitmapRenderTarget::CreateBitmapFromWicBitmap (vtable slot 5)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, wicBitmapSource, bitmapProperties, bitmap
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
wicBitmapSource : [comobj] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateSharedBitmap
ID2D1BitmapRenderTarget::CreateSharedBitmap (vtable slot 6)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, riid, data, bitmapProperties, bitmap
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
riid : [var] 
data : [intptr] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateBitmapBrush
ID2D1BitmapRenderTarget::CreateBitmapBrush (vtable slot 7)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, bitmap, bitmapBrushProperties, brushProperties, bitmapBrush
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
bitmap : [comobj] 
bitmapBrushProperties : [var] 
brushProperties : [var] 
bitmapBrush : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateSolidColorBrush
ID2D1BitmapRenderTarget::CreateSolidColorBrush (vtable slot 8)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, color, brushProperties, solidColorBrush
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
color : [var] 
brushProperties : [var] 
solidColorBrush : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateGradientStopCollection
ID2D1BitmapRenderTarget::CreateGradientStopCollection (vtable slot 9)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, gradientStops, gradientStopsCount, colorInterpolationGamma, extendMode, gradientStopCollection
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
gradientStops : [var] 
gradientStopsCount : [int] 
colorInterpolationGamma : [int] 
extendMode : [int] 
gradientStopCollection : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateLinearGradientBrush
ID2D1BitmapRenderTarget::CreateLinearGradientBrush (vtable slot 10)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, linearGradientBrushProperties, brushProperties, gradientStopCollection, linearGradientBrush
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
linearGradientBrushProperties : [var] 
brushProperties : [var] 
gradientStopCollection : [comobj] 
linearGradientBrush : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateRadialGradientBrush
ID2D1BitmapRenderTarget::CreateRadialGradientBrush (vtable slot 11)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, radialGradientBrushProperties, brushProperties, gradientStopCollection, radialGradientBrush
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
radialGradientBrushProperties : [var] 
brushProperties : [var] 
gradientStopCollection : [comobj] 
radialGradientBrush : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateCompatibleRenderTarget
ID2D1BitmapRenderTarget::CreateCompatibleRenderTarget (vtable slot 12)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, desiredSize, desiredPixelSize, desiredFormat, options, bitmapRenderTarget
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
desiredSize : [var] 
desiredPixelSize : [var] 
desiredFormat : [var] 
options : [int] 
bitmapRenderTarget : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateLayer
ID2D1BitmapRenderTarget::CreateLayer (vtable slot 13)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, size, layer
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
size : [var] 
layer : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateMesh
ID2D1BitmapRenderTarget::CreateMesh (vtable slot 14)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, mesh
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
mesh : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_DrawLine
ID2D1BitmapRenderTarget::DrawLine (vtable slot 15)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, point0, point1, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
point0 : [int] 
point1 : [int] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_DrawRectangle
ID2D1BitmapRenderTarget::DrawRectangle (vtable slot 16)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, rect, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
rect : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_FillRectangle
ID2D1BitmapRenderTarget::FillRectangle (vtable slot 17)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, rect, brush
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
rect : [var] 
brush : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_DrawRoundedRectangle
ID2D1BitmapRenderTarget::DrawRoundedRectangle (vtable slot 18)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, roundedRect, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
roundedRect : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_FillRoundedRectangle
ID2D1BitmapRenderTarget::FillRoundedRectangle (vtable slot 19)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, roundedRect, brush
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
roundedRect : [var] 
brush : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_DrawEllipse
ID2D1BitmapRenderTarget::DrawEllipse (vtable slot 20)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, ellipse, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
ellipse : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_FillEllipse
ID2D1BitmapRenderTarget::FillEllipse (vtable slot 21)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, ellipse, brush
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
ellipse : [var] 
brush : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_DrawGeometry
ID2D1BitmapRenderTarget::DrawGeometry (vtable slot 22)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, geometry, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
geometry : [comobj] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_FillGeometry
ID2D1BitmapRenderTarget::FillGeometry (vtable slot 23)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, geometry, brush, opacityBrush
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
geometry : [comobj] 
brush : [comobj] 
opacityBrush : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_FillMesh
ID2D1BitmapRenderTarget::FillMesh (vtable slot 24)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, mesh, brush
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
mesh : [comobj] 
brush : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_FillOpacityMask
ID2D1BitmapRenderTarget::FillOpacityMask (vtable slot 25)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, opacityMask, brush, content, destinationRectangle, sourceRectangle
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
opacityMask : [comobj] 
brush : [comobj] 
content : [int] 
destinationRectangle : [var] 
sourceRectangle : [var] 
%inst


%index
ID2D1BitmapRenderTarget_DrawBitmap
ID2D1BitmapRenderTarget::DrawBitmap (vtable slot 26)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, bitmap, destinationRectangle, opacity, interpolationMode, sourceRectangle
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
bitmap : [comobj] 
destinationRectangle : [var] 
opacity : [float] 
interpolationMode : [int] 
sourceRectangle : [var] 
%inst


%index
ID2D1BitmapRenderTarget_DrawText
ID2D1BitmapRenderTarget::DrawText (vtable slot 27)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, string, stringLength, textFormat, layoutRect, defaultFillBrush, options, measuringMode
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
string : [int] 
stringLength : [int] 
textFormat : [comobj] 
layoutRect : [var] 
defaultFillBrush : [comobj] 
options : [int] 
measuringMode : [int] 
%inst


%index
ID2D1BitmapRenderTarget_DrawTextLayout
ID2D1BitmapRenderTarget::DrawTextLayout (vtable slot 28)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, origin, textLayout, defaultFillBrush, options
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
origin : [int] 
textLayout : [comobj] 
defaultFillBrush : [comobj] 
options : [int] 
%inst


%index
ID2D1BitmapRenderTarget_DrawGlyphRun
ID2D1BitmapRenderTarget::DrawGlyphRun (vtable slot 29)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, baselineOrigin, glyphRun, foregroundBrush, measuringMode
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
baselineOrigin : [int] 
glyphRun : [int] 
foregroundBrush : [comobj] 
measuringMode : [int] 
%inst


%index
ID2D1BitmapRenderTarget_SetTransform
ID2D1BitmapRenderTarget::SetTransform (vtable slot 30)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, transform
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1BitmapRenderTarget_GetTransform
ID2D1BitmapRenderTarget::GetTransform (vtable slot 31)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, transform
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1BitmapRenderTarget_SetAntialiasMode
ID2D1BitmapRenderTarget::SetAntialiasMode (vtable slot 32)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, antialiasMode
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
antialiasMode : [int] 
%inst


%index
ID2D1BitmapRenderTarget_GetAntialiasMode
ID2D1BitmapRenderTarget::GetAntialiasMode (vtable slot 33)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1BitmapRenderTarget_SetTextAntialiasMode
ID2D1BitmapRenderTarget::SetTextAntialiasMode (vtable slot 34)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, textAntialiasMode
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
textAntialiasMode : [int] 
%inst


%index
ID2D1BitmapRenderTarget_GetTextAntialiasMode
ID2D1BitmapRenderTarget::GetTextAntialiasMode (vtable slot 35)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1BitmapRenderTarget_SetTextRenderingParams
ID2D1BitmapRenderTarget::SetTextRenderingParams (vtable slot 36)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, textRenderingParams
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
textRenderingParams : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_GetTextRenderingParams
ID2D1BitmapRenderTarget::GetTextRenderingParams (vtable slot 37)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, textRenderingParams
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
textRenderingParams : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_SetTags
ID2D1BitmapRenderTarget::SetTags (vtable slot 38)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, tag1, tag2
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
tag1 : [int64] 
tag2 : [int64] 
%inst


%index
ID2D1BitmapRenderTarget_GetTags
ID2D1BitmapRenderTarget::GetTags (vtable slot 39)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, tag1, tag2
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 
tag2 : [var] 
%inst


%index
ID2D1BitmapRenderTarget_PushLayer
ID2D1BitmapRenderTarget::PushLayer (vtable slot 40)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, layerParameters, layer
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
layerParameters : [int] 
layer : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_PopLayer
ID2D1BitmapRenderTarget::PopLayer (vtable slot 41)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1BitmapRenderTarget_Flush
ID2D1BitmapRenderTarget::Flush (vtable slot 42)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, tag1, tag2
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 
tag2 : [var] 
%inst


%index
ID2D1BitmapRenderTarget_SaveDrawingState
ID2D1BitmapRenderTarget::SaveDrawingState (vtable slot 43)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, drawingStateBlock
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
drawingStateBlock : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_RestoreDrawingState
ID2D1BitmapRenderTarget::RestoreDrawingState (vtable slot 44)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, drawingStateBlock
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
drawingStateBlock : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_PushAxisAlignedClip
ID2D1BitmapRenderTarget::PushAxisAlignedClip (vtable slot 45)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, clipRect, antialiasMode
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
clipRect : [var] 
antialiasMode : [int] 
%inst


%index
ID2D1BitmapRenderTarget_PopAxisAlignedClip
ID2D1BitmapRenderTarget::PopAxisAlignedClip (vtable slot 46)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1BitmapRenderTarget_Clear
ID2D1BitmapRenderTarget::Clear (vtable slot 47)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, clearColor
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
clearColor : [var] 
%inst


%index
ID2D1BitmapRenderTarget_BeginDraw
ID2D1BitmapRenderTarget::BeginDraw (vtable slot 48)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1BitmapRenderTarget_EndDraw
ID2D1BitmapRenderTarget::EndDraw (vtable slot 49)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, tag1, tag2
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 
tag2 : [var] 
%inst


%index
ID2D1BitmapRenderTarget_GetPixelFormat
ID2D1BitmapRenderTarget::GetPixelFormat (vtable slot 50)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1BitmapRenderTarget_SetDpi
ID2D1BitmapRenderTarget::SetDpi (vtable slot 51)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, dpiX, dpiY
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
dpiX : [float] 
dpiY : [float] 
%inst


%index
ID2D1BitmapRenderTarget_GetDpi
ID2D1BitmapRenderTarget::GetDpi (vtable slot 52)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, dpiX, dpiY
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
dpiX : [float] 
dpiY : [float] 
%inst


%index
ID2D1BitmapRenderTarget_GetSize
ID2D1BitmapRenderTarget::GetSize (vtable slot 53)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1BitmapRenderTarget_GetPixelSize
ID2D1BitmapRenderTarget::GetPixelSize (vtable slot 54)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1BitmapRenderTarget_GetMaximumBitmapSize
ID2D1BitmapRenderTarget::GetMaximumBitmapSize (vtable slot 55)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1BitmapRenderTarget_IsSupported
ID2D1BitmapRenderTarget::IsSupported (vtable slot 56)
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, renderTargetProperties
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
renderTargetProperties : [var] 
%inst


%index
ID2D1BitmapRenderTarget_GetBitmap
Retrieves the bitmap for this render target. The returned bitmap can be used for drawing operations.
%group
COM misc / ID2D1BitmapRenderTarget
%prm
this, bitmap
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
bitmap : [comobj] Type: ID2D1Bitmap** When this method returns, contains the address of a pointer to the bitmap for this render target. This bitmap can be used for drawing operations.
%inst
Retrieves the bitmap for this render target. The returned bitmap can
be used for drawing operations.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
error code.

[備考]
The DPI for the ID2D1Bitmap obtained from GetBitmap will be the DPI
of the ID2D1BitmapRenderTarget when the render target was created.
Changing the DPI of the ID2D1BitmapRenderTarget by calling SetDpi
doesn't affect the DPI of the bitmap, even if SetDpi is called before
GetBitmap. Using SetDpi to change the DPI of the
ID2D1BitmapRenderTarget does affect how contents are rendered into
the bitmap: it just doesn't affect the DPI of the bitmap retrieved by
GetBitmap.


%index
ID2D1Brush_GetFactory
ID2D1Brush::GetFactory (vtable slot 3)
%group
COM misc / ID2D1Brush
%prm
this, factory
this : [comobj] ID2D1Brush インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1Brush_SetOpacity
Sets the degree of opacity of this brush.
%group
COM misc / ID2D1Brush
%prm
this, opacity
this : [comobj] ID2D1Brush インターフェースの COM オブジェクト変数
opacity : [float] Type: FLOAT A value between zero and 1 that indicates the opacity of the brush. This value is a constant multiplier that linearly scales the alpha value of all pixels filled by the brush. The opacity values are clamped in the range 0?1 before they are multiplied together.
%inst
Sets the degree of opacity of this brush.


%index
ID2D1Brush_SetTransform
Sets the transformation applied to the brush.
%group
COM misc / ID2D1Brush
%prm
this, transform
this : [comobj] ID2D1Brush インターフェースの COM オブジェクト変数
transform : [var] 
%inst
Sets the transformation applied to the brush.

[備考]
When you paint with a brush, it paints in the coordinate space of the
render target. Brushes do not automatically position themselves to
align with the object being painted; by default, they begin painting
at the origin (0, 0) of the render target. You can "move" the
gradient defined by an
[**ID2D1LinearGradientBrush**](/windows/win32/api/d2d1/nn-d2d1-id2d1lineargradientbrush)
to a target area by setting its start point and end point. Likewise,
you can move the gradient defined by an
[**ID2D1RadialGradientBrush**](/windows/win32/api/d2d1/nn-d2d1-id2d1radialgradientbrush)
by changing its center and radii. To align the content of an
[**ID2D1BitmapBrush**](/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush)
to the area being painted, you can use the **SetTransform** method to
translate the bitmap to the desired location. This transform only
affects the brush; it does not affect any other content drawn by the
render target. The following illustrations show the effect of using
an
[**ID2D1BitmapBrush**](/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush)
to fill a rectangle located at (100, 100). The illustration on the
left illustration shows the result of filling the rectangle without
transforming the brush: the bitmap is drawn at the render target's
origin. As a result, only a portion of the bitmap appears in the
rectangle. The illustration on the right shows the result of
transforming the
[**ID2D1BitmapBrush**](/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush)
so that its content is shifted 50 pixels to the right and 50 pixels
down. The bitmap now fills the rectangle. ![illustration of two
squares, one painted with a bitmap without a transformed brush and
one painted with a transformed
brush](images/brushes-ovw-transform.png)


%index
ID2D1Brush_GetOpacity
Gets the degree of opacity of this brush.
%group
COM misc / ID2D1Brush
%prm
this
this : [comobj] ID2D1Brush インターフェースの COM オブジェクト変数
%inst
Gets the degree of opacity of this brush.

[戻り値]
Type: FLOAT A value between zero and 1 that indicates the opacity of
the brush. This value is a constant multiplier that linearly scales
the alpha value of all pixels filled by the brush. The opacity values
are clamped in the range 0?1 before they are multiplied together.


%index
ID2D1Brush_GetTransform
Gets the transform applied to this brush.
%group
COM misc / ID2D1Brush
%prm
this, transform
this : [comobj] ID2D1Brush インターフェースの COM オブジェクト変数
transform : [var] Type: D2D1_MATRIX_3X2_F* The transform applied to this brush.
%inst
Gets the transform applied to this brush.

[備考]
When the brush transform is the identity matrix, the brush appears in
the same coordinate space as the render target in which it is drawn.


%index
ID2D1DCRenderTarget_GetFactory
ID2D1DCRenderTarget::GetFactory (vtable slot 3)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, factory
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateBitmap
ID2D1DCRenderTarget::CreateBitmap (vtable slot 4)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, size, srcData, pitch, bitmapProperties, bitmap
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
size : [int] 
srcData : [intptr] 
pitch : [int] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateBitmapFromWicBitmap
ID2D1DCRenderTarget::CreateBitmapFromWicBitmap (vtable slot 5)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, wicBitmapSource, bitmapProperties, bitmap
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
wicBitmapSource : [comobj] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateSharedBitmap
ID2D1DCRenderTarget::CreateSharedBitmap (vtable slot 6)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, riid, data, bitmapProperties, bitmap
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
riid : [var] 
data : [intptr] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateBitmapBrush
ID2D1DCRenderTarget::CreateBitmapBrush (vtable slot 7)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, bitmap, bitmapBrushProperties, brushProperties, bitmapBrush
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
bitmap : [comobj] 
bitmapBrushProperties : [var] 
brushProperties : [var] 
bitmapBrush : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateSolidColorBrush
ID2D1DCRenderTarget::CreateSolidColorBrush (vtable slot 8)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, color, brushProperties, solidColorBrush
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
color : [var] 
brushProperties : [var] 
solidColorBrush : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateGradientStopCollection
ID2D1DCRenderTarget::CreateGradientStopCollection (vtable slot 9)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, gradientStops, gradientStopsCount, colorInterpolationGamma, extendMode, gradientStopCollection
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
gradientStops : [var] 
gradientStopsCount : [int] 
colorInterpolationGamma : [int] 
extendMode : [int] 
gradientStopCollection : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateLinearGradientBrush
ID2D1DCRenderTarget::CreateLinearGradientBrush (vtable slot 10)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, linearGradientBrushProperties, brushProperties, gradientStopCollection, linearGradientBrush
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
linearGradientBrushProperties : [var] 
brushProperties : [var] 
gradientStopCollection : [comobj] 
linearGradientBrush : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateRadialGradientBrush
ID2D1DCRenderTarget::CreateRadialGradientBrush (vtable slot 11)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, radialGradientBrushProperties, brushProperties, gradientStopCollection, radialGradientBrush
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
radialGradientBrushProperties : [var] 
brushProperties : [var] 
gradientStopCollection : [comobj] 
radialGradientBrush : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateCompatibleRenderTarget
ID2D1DCRenderTarget::CreateCompatibleRenderTarget (vtable slot 12)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, desiredSize, desiredPixelSize, desiredFormat, options, bitmapRenderTarget
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
desiredSize : [var] 
desiredPixelSize : [var] 
desiredFormat : [var] 
options : [int] 
bitmapRenderTarget : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateLayer
ID2D1DCRenderTarget::CreateLayer (vtable slot 13)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, size, layer
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
size : [var] 
layer : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateMesh
ID2D1DCRenderTarget::CreateMesh (vtable slot 14)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, mesh
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
mesh : [comobj] 
%inst


%index
ID2D1DCRenderTarget_DrawLine
ID2D1DCRenderTarget::DrawLine (vtable slot 15)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, point0, point1, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
point0 : [int] 
point1 : [int] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1DCRenderTarget_DrawRectangle
ID2D1DCRenderTarget::DrawRectangle (vtable slot 16)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, rect, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
rect : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1DCRenderTarget_FillRectangle
ID2D1DCRenderTarget::FillRectangle (vtable slot 17)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, rect, brush
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
rect : [var] 
brush : [comobj] 
%inst


%index
ID2D1DCRenderTarget_DrawRoundedRectangle
ID2D1DCRenderTarget::DrawRoundedRectangle (vtable slot 18)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, roundedRect, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
roundedRect : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1DCRenderTarget_FillRoundedRectangle
ID2D1DCRenderTarget::FillRoundedRectangle (vtable slot 19)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, roundedRect, brush
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
roundedRect : [var] 
brush : [comobj] 
%inst


%index
ID2D1DCRenderTarget_DrawEllipse
ID2D1DCRenderTarget::DrawEllipse (vtable slot 20)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, ellipse, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
ellipse : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1DCRenderTarget_FillEllipse
ID2D1DCRenderTarget::FillEllipse (vtable slot 21)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, ellipse, brush
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
ellipse : [var] 
brush : [comobj] 
%inst


%index
ID2D1DCRenderTarget_DrawGeometry
ID2D1DCRenderTarget::DrawGeometry (vtable slot 22)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, geometry, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
geometry : [comobj] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1DCRenderTarget_FillGeometry
ID2D1DCRenderTarget::FillGeometry (vtable slot 23)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, geometry, brush, opacityBrush
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
geometry : [comobj] 
brush : [comobj] 
opacityBrush : [comobj] 
%inst


%index
ID2D1DCRenderTarget_FillMesh
ID2D1DCRenderTarget::FillMesh (vtable slot 24)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, mesh, brush
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
mesh : [comobj] 
brush : [comobj] 
%inst


%index
ID2D1DCRenderTarget_FillOpacityMask
ID2D1DCRenderTarget::FillOpacityMask (vtable slot 25)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, opacityMask, brush, content, destinationRectangle, sourceRectangle
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
opacityMask : [comobj] 
brush : [comobj] 
content : [int] 
destinationRectangle : [var] 
sourceRectangle : [var] 
%inst


%index
ID2D1DCRenderTarget_DrawBitmap
ID2D1DCRenderTarget::DrawBitmap (vtable slot 26)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, bitmap, destinationRectangle, opacity, interpolationMode, sourceRectangle
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
bitmap : [comobj] 
destinationRectangle : [var] 
opacity : [float] 
interpolationMode : [int] 
sourceRectangle : [var] 
%inst


%index
ID2D1DCRenderTarget_DrawText
ID2D1DCRenderTarget::DrawText (vtable slot 27)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, string, stringLength, textFormat, layoutRect, defaultFillBrush, options, measuringMode
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
string : [int] 
stringLength : [int] 
textFormat : [comobj] 
layoutRect : [var] 
defaultFillBrush : [comobj] 
options : [int] 
measuringMode : [int] 
%inst


%index
ID2D1DCRenderTarget_DrawTextLayout
ID2D1DCRenderTarget::DrawTextLayout (vtable slot 28)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, origin, textLayout, defaultFillBrush, options
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
origin : [int] 
textLayout : [comobj] 
defaultFillBrush : [comobj] 
options : [int] 
%inst


%index
ID2D1DCRenderTarget_DrawGlyphRun
ID2D1DCRenderTarget::DrawGlyphRun (vtable slot 29)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, baselineOrigin, glyphRun, foregroundBrush, measuringMode
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
baselineOrigin : [int] 
glyphRun : [int] 
foregroundBrush : [comobj] 
measuringMode : [int] 
%inst


%index
ID2D1DCRenderTarget_SetTransform
ID2D1DCRenderTarget::SetTransform (vtable slot 30)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, transform
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1DCRenderTarget_GetTransform
ID2D1DCRenderTarget::GetTransform (vtable slot 31)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, transform
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1DCRenderTarget_SetAntialiasMode
ID2D1DCRenderTarget::SetAntialiasMode (vtable slot 32)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, antialiasMode
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
antialiasMode : [int] 
%inst


%index
ID2D1DCRenderTarget_GetAntialiasMode
ID2D1DCRenderTarget::GetAntialiasMode (vtable slot 33)
%group
COM misc / ID2D1DCRenderTarget
%prm
this
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1DCRenderTarget_SetTextAntialiasMode
ID2D1DCRenderTarget::SetTextAntialiasMode (vtable slot 34)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, textAntialiasMode
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
textAntialiasMode : [int] 
%inst


%index
ID2D1DCRenderTarget_GetTextAntialiasMode
ID2D1DCRenderTarget::GetTextAntialiasMode (vtable slot 35)
%group
COM misc / ID2D1DCRenderTarget
%prm
this
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1DCRenderTarget_SetTextRenderingParams
ID2D1DCRenderTarget::SetTextRenderingParams (vtable slot 36)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, textRenderingParams
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
textRenderingParams : [comobj] 
%inst


%index
ID2D1DCRenderTarget_GetTextRenderingParams
ID2D1DCRenderTarget::GetTextRenderingParams (vtable slot 37)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, textRenderingParams
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
textRenderingParams : [comobj] 
%inst


%index
ID2D1DCRenderTarget_SetTags
ID2D1DCRenderTarget::SetTags (vtable slot 38)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, tag1, tag2
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
tag1 : [int64] 
tag2 : [int64] 
%inst


%index
ID2D1DCRenderTarget_GetTags
ID2D1DCRenderTarget::GetTags (vtable slot 39)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, tag1, tag2
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 
tag2 : [var] 
%inst


%index
ID2D1DCRenderTarget_PushLayer
ID2D1DCRenderTarget::PushLayer (vtable slot 40)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, layerParameters, layer
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
layerParameters : [int] 
layer : [comobj] 
%inst


%index
ID2D1DCRenderTarget_PopLayer
ID2D1DCRenderTarget::PopLayer (vtable slot 41)
%group
COM misc / ID2D1DCRenderTarget
%prm
this
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1DCRenderTarget_Flush
ID2D1DCRenderTarget::Flush (vtable slot 42)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, tag1, tag2
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 
tag2 : [var] 
%inst


%index
ID2D1DCRenderTarget_SaveDrawingState
ID2D1DCRenderTarget::SaveDrawingState (vtable slot 43)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, drawingStateBlock
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
drawingStateBlock : [comobj] 
%inst


%index
ID2D1DCRenderTarget_RestoreDrawingState
ID2D1DCRenderTarget::RestoreDrawingState (vtable slot 44)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, drawingStateBlock
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
drawingStateBlock : [comobj] 
%inst


%index
ID2D1DCRenderTarget_PushAxisAlignedClip
ID2D1DCRenderTarget::PushAxisAlignedClip (vtable slot 45)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, clipRect, antialiasMode
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
clipRect : [var] 
antialiasMode : [int] 
%inst


%index
ID2D1DCRenderTarget_PopAxisAlignedClip
ID2D1DCRenderTarget::PopAxisAlignedClip (vtable slot 46)
%group
COM misc / ID2D1DCRenderTarget
%prm
this
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1DCRenderTarget_Clear
ID2D1DCRenderTarget::Clear (vtable slot 47)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, clearColor
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
clearColor : [var] 
%inst


%index
ID2D1DCRenderTarget_BeginDraw
ID2D1DCRenderTarget::BeginDraw (vtable slot 48)
%group
COM misc / ID2D1DCRenderTarget
%prm
this
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1DCRenderTarget_EndDraw
ID2D1DCRenderTarget::EndDraw (vtable slot 49)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, tag1, tag2
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 
tag2 : [var] 
%inst


%index
ID2D1DCRenderTarget_GetPixelFormat
ID2D1DCRenderTarget::GetPixelFormat (vtable slot 50)
%group
COM misc / ID2D1DCRenderTarget
%prm
this
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1DCRenderTarget_SetDpi
ID2D1DCRenderTarget::SetDpi (vtable slot 51)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, dpiX, dpiY
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
dpiX : [float] 
dpiY : [float] 
%inst


%index
ID2D1DCRenderTarget_GetDpi
ID2D1DCRenderTarget::GetDpi (vtable slot 52)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, dpiX, dpiY
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
dpiX : [float] 
dpiY : [float] 
%inst


%index
ID2D1DCRenderTarget_GetSize
ID2D1DCRenderTarget::GetSize (vtable slot 53)
%group
COM misc / ID2D1DCRenderTarget
%prm
this
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1DCRenderTarget_GetPixelSize
ID2D1DCRenderTarget::GetPixelSize (vtable slot 54)
%group
COM misc / ID2D1DCRenderTarget
%prm
this
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1DCRenderTarget_GetMaximumBitmapSize
ID2D1DCRenderTarget::GetMaximumBitmapSize (vtable slot 55)
%group
COM misc / ID2D1DCRenderTarget
%prm
this
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1DCRenderTarget_IsSupported
ID2D1DCRenderTarget::IsSupported (vtable slot 56)
%group
COM misc / ID2D1DCRenderTarget
%prm
this, renderTargetProperties
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
renderTargetProperties : [var] 
%inst


%index
ID2D1DCRenderTarget_BindDC
Binds the render target to the device context to which it issues drawing commands.
%group
COM misc / ID2D1DCRenderTarget
%prm
this, hDC, pSubRect
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
hDC : [intptr] Type: const HDC The device context to which the render target issues drawing commands.
pSubRect : [var] Type: const RECT* The dimensions of the handle to a device context (HDC) to which the render target is bound.
%inst
Binds the render target to the device context to which it issues
drawing commands.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
error code.

[備考]
Before you can render with the DC render target, you must use its
BindDC method to associate it with a GDI DC. You do this each time
you use a different DC, or the size of the area you want to draw to
changes.


%index
ID2D1DrawingStateBlock_GetFactory
ID2D1DrawingStateBlock::GetFactory (vtable slot 3)
%group
COM misc / ID2D1DrawingStateBlock
%prm
this, factory
this : [comobj] ID2D1DrawingStateBlock インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1DrawingStateBlock_GetDescription
Retrieves the antialiasing mode, transform, and tags portion of the drawing state.
%group
COM misc / ID2D1DrawingStateBlock
%prm
this, stateDescription
this : [comobj] ID2D1DrawingStateBlock インターフェースの COM オブジェクト変数
stateDescription : [var] Type: D2D1_DRAWING_STATE_DESCRIPTION* When this method returns, contains the antialiasing mode, transform, and tags portion of the drawing state. You must allocate storage for this parameter.
%inst
Retrieves the antialiasing mode, transform, and tags portion of the
drawing state.


%index
ID2D1DrawingStateBlock_SetDescription
Specifies the antialiasing mode, transform, and tags portion of the drawing state.
%group
COM misc / ID2D1DrawingStateBlock
%prm
this, stateDescription
this : [comobj] ID2D1DrawingStateBlock インターフェースの COM オブジェクト変数
stateDescription : [var] 
%inst
Specifies the antialiasing mode, transform, and tags portion of the
drawing state.


%index
ID2D1DrawingStateBlock_SetTextRenderingParams
Specifies the text-rendering configuration of the drawing state.
%group
COM misc / ID2D1DrawingStateBlock
%prm
this, textRenderingParams
this : [comobj] ID2D1DrawingStateBlock インターフェースの COM オブジェクト変数
textRenderingParams : [comobj] Type: IDWriteRenderingParams* The text-rendering configuration of the drawing state, or NULL to use default settings.
%inst
Specifies the text-rendering configuration of the drawing state.


%index
ID2D1DrawingStateBlock_GetTextRenderingParams
Retrieves the text-rendering configuration of the drawing state.
%group
COM misc / ID2D1DrawingStateBlock
%prm
this, textRenderingParams
this : [comobj] ID2D1DrawingStateBlock インターフェースの COM オブジェクト変数
textRenderingParams : [comobj] Type: IDWriteRenderingParams** When this method returns, contains the address of a pointer to an IDWriteRenderingParams object that describes the text-rendering configuration of the drawing state.
%inst
Retrieves the text-rendering configuration of the drawing state.


%index
ID2D1EllipseGeometry_GetFactory
ID2D1EllipseGeometry::GetFactory (vtable slot 3)
%group
COM misc / ID2D1EllipseGeometry
%prm
this, factory
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1EllipseGeometry_GetBounds
ID2D1EllipseGeometry::GetBounds (vtable slot 4)
%group
COM misc / ID2D1EllipseGeometry
%prm
this, worldTransform, bounds
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
bounds : [var] 
%inst


%index
ID2D1EllipseGeometry_GetWidenedBounds
ID2D1EllipseGeometry::GetWidenedBounds (vtable slot 5)
%group
COM misc / ID2D1EllipseGeometry
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, bounds
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
bounds : [var] 
%inst


%index
ID2D1EllipseGeometry_StrokeContainsPoint
ID2D1EllipseGeometry::StrokeContainsPoint (vtable slot 6)
%group
COM misc / ID2D1EllipseGeometry
%prm
this, point, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
point : [int] 
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1EllipseGeometry_FillContainsPoint
ID2D1EllipseGeometry::FillContainsPoint (vtable slot 7)
%group
COM misc / ID2D1EllipseGeometry
%prm
this, point, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
point : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1EllipseGeometry_CompareWithGeometry
ID2D1EllipseGeometry::CompareWithGeometry (vtable slot 8)
%group
COM misc / ID2D1EllipseGeometry
%prm
this, inputGeometry, inputGeometryTransform, flatteningTolerance, relation
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
relation : [var] 
%inst


%index
ID2D1EllipseGeometry_Simplify
ID2D1EllipseGeometry::Simplify (vtable slot 9)
%group
COM misc / ID2D1EllipseGeometry
%prm
this, simplificationOption, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
simplificationOption : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1EllipseGeometry_Tessellate
ID2D1EllipseGeometry::Tessellate (vtable slot 10)
%group
COM misc / ID2D1EllipseGeometry
%prm
this, worldTransform, flatteningTolerance, tessellationSink
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
tessellationSink : [comobj] 
%inst


%index
ID2D1EllipseGeometry_CombineWithGeometry
ID2D1EllipseGeometry::CombineWithGeometry (vtable slot 11)
%group
COM misc / ID2D1EllipseGeometry
%prm
this, inputGeometry, combineMode, inputGeometryTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
combineMode : [int] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1EllipseGeometry_Outline
ID2D1EllipseGeometry::Outline (vtable slot 12)
%group
COM misc / ID2D1EllipseGeometry
%prm
this, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1EllipseGeometry_ComputeArea
ID2D1EllipseGeometry::ComputeArea (vtable slot 13)
%group
COM misc / ID2D1EllipseGeometry
%prm
this, worldTransform, flatteningTolerance, area
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
area : [float] 
%inst


%index
ID2D1EllipseGeometry_ComputeLength
ID2D1EllipseGeometry::ComputeLength (vtable slot 14)
%group
COM misc / ID2D1EllipseGeometry
%prm
this, worldTransform, flatteningTolerance, length
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
length : [float] 
%inst


%index
ID2D1EllipseGeometry_ComputePointAtLength
ID2D1EllipseGeometry::ComputePointAtLength (vtable slot 15)
%group
COM misc / ID2D1EllipseGeometry
%prm
this, length, worldTransform, flatteningTolerance, point, unitTangentVector
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
length : [float] 
worldTransform : [var] 
flatteningTolerance : [float] 
point : [var] 
unitTangentVector : [var] 
%inst


%index
ID2D1EllipseGeometry_Widen
ID2D1EllipseGeometry::Widen (vtable slot 16)
%group
COM misc / ID2D1EllipseGeometry
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1EllipseGeometry_GetEllipse
Gets the D2D1_ELLIPSE structure that describes this ellipse geometry.
%group
COM misc / ID2D1EllipseGeometry
%prm
this, ellipse
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
ellipse : [var] Type: D2D1_ELLIPSE* When this method returns, contains the D2D1_ELLIPSE that describes the size and position of the ellipse. You must allocate storage for this parameter.
%inst
Gets the D2D1_ELLIPSE structure that describes this ellipse geometry.


%index
ID2D1Factory_ReloadSystemMetrics
ファクトリー作成後に変更された可能性のあるシステム既定値を、強制的にリロードする。
%group
COM misc / ID2D1Factory
%prm
this
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
%inst
ファクトリー作成後に変更された可能性のあるシステム既定値を、強制的にリロードする。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]
システム DPI
を最新の状態にするため、[GetDesktopDpi](/windows/win32/api/d2d1/nf-d2d1-id2d1factory-getdesktopdpi)
メソッドを呼び出す前に **ID2D1Factory.ReloadSystemMetrics** を呼び出しておくべきである。


%index
ID2D1Factory_GetDesktopDpi
現在のデスクトップの DPI (dots per inch) を取得する。この値を更新するには ReloadSystemMetrics を呼び出す。
%group
COM misc / ID2D1Factory
%prm
this, dpiX, dpiY
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
dpiX : [float] 型: FLOAT* このメソッドが戻るとデスクトップの水平 DPI が格納される。このパラメーターの格納領域は呼び出し側が確保する必要がある。
dpiY : [float] 型: FLOAT* このメソッドが戻るとデスクトップの垂直 DPI が格納される。このパラメーターの格納領域は呼び出し側が確保する必要がある。
%inst
現在のデスクトップの DPI (dots per inch) を取得する。この値を更新するには ReloadSystemMetrics
を呼び出す。

[備考]
ウィンドウのサイズ指定など、物理ピクセル値を設定する際にシステム DPI を取得するためにこのメソッドを使用する。


%index
ID2D1Factory_CreateRectangleGeometry
ID2D1RectangleGeometry を作成する。
%group
COM misc / ID2D1Factory
%prm
this, rectangle, rectangleGeometry
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
rectangle : [var] 
rectangleGeometry : [comobj] 
%inst
ID2D1RectangleGeometry を作成する。


%index
ID2D1Factory_CreateRoundedRectangleGeometry
ID2D1RoundedRectangleGeometry を作成する。
%group
COM misc / ID2D1Factory
%prm
this, roundedRectangle, roundedRectangleGeometry
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
roundedRectangle : [var] 
roundedRectangleGeometry : [comobj] 
%inst
ID2D1RoundedRectangleGeometry を作成する。


%index
ID2D1Factory_CreateEllipseGeometry
ID2D1EllipseGeometry を作成する。
%group
COM misc / ID2D1Factory
%prm
this, ellipse, ellipseGeometry
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
ellipse : [var] 
ellipseGeometry : [comobj] 
%inst
ID2D1EllipseGeometry を作成する。


%index
ID2D1Factory_CreateGeometryGroup
他のジオメトリーを保持するオブジェクトである ID2D1GeometryGroup を作成する。
%group
COM misc / ID2D1Factory
%prm
this, fillMode, geometries, geometriesCount, geometryGroup
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
fillMode : [int] 型: D2D1_FILL_MODE 複合シェイプが、ある点がジオメトリーに含まれるかどうかを判定するために使用するルールを指定する値。
geometries : [comobj] 型: ID2D1Geometry** ジオメトリーグループに追加するジオメトリーオブジェクトを含む配列。この配列の要素数は geometriesCount パラメーターで示される。
geometriesCount : [int] 型: UINT geometries の要素数。
geometryGroup : [comobj] 型: ID2D1GeometryGroup** このメソッドが戻ると、このメソッドが作成したジオメトリーグループへのポインターのアドレスが格納される。
%inst
他のジオメトリーを保持するオブジェクトである ID2D1GeometryGroup を作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]
ジオメトリーグループは複数のジオメトリーを同時にグループ化する便利な方法であり、複数の異なるジオメトリーのすべての図形を 1
つに連結する。ID2D1GeometryGroup オブジェクトを作成するには ID2D1Factory オブジェクトで
CreateGeometryGroup メソッドを呼び出し、fillMode（D2D1_FILL_MODE_ALTERNATE または
D2D1_FILL_MODE_WINDING）、ジオメトリーグループに追加するジオメトリーオブジェクトの配列、およびこの配列の要素数を渡す。


%index
ID2D1Factory_CreateTransformedGeometry
指定したジオメトリーを変換し、その結果を ID2D1TransformedGeometry オブジェクトとして格納する。
%group
COM misc / ID2D1Factory
%prm
this, sourceGeometry, transform, transformedGeometry
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
sourceGeometry : [comobj] 
transform : [var] 
transformedGeometry : [comobj] 
%inst
指定したジオメトリーを変換し、その結果を ID2D1TransformedGeometry オブジェクトとして格納する。

[備考]

他のリソースと同様、変換済みジオメトリーは作成元ファクトリーのリソース空間とスレッディングポリシーを継承する。このオブジェクトは不変である。変換済みジオメトリーを
[**DrawGeometry**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawgeometry)
メソッドでストロークする場合、ストローク幅はジオメトリーに適用された変換の影響を受けない。ストローク幅はワールド変換にのみ影響される。


%index
ID2D1Factory_CreatePathGeometry
空の ID2D1PathGeometry を作成する。
%group
COM misc / ID2D1Factory
%prm
this, pathGeometry
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
pathGeometry : [comobj] 型: ID2D1PathGeometry** このメソッドが戻ると、このメソッドが作成したパスジオメトリーへのポインターのアドレスが格納される。
%inst
空の ID2D1PathGeometry を作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。


%index
ID2D1Factory_CreateStrokeStyle
ストロークの開始キャップ、破線パターン、その他の特徴を記述する ID2D1StrokeStyle を作成する。
%group
COM misc / ID2D1Factory
%prm
this, strokeStyleProperties, dashes, dashesCount, strokeStyle
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
strokeStyleProperties : [var] 
dashes : [var] 
dashesCount : [int] 
strokeStyle : [comobj] 
%inst
ストロークの開始キャップ、破線パターン、その他の特徴を記述する ID2D1StrokeStyle を作成する。


%index
ID2D1Factory_CreateDrawingStateBlock
レンダーターゲットの SaveDrawingState メソッドおよび RestoreDrawingState メソッドで使用できる ID2D1DrawingStateBlock を作成する。
%group
COM misc / ID2D1Factory
%prm
this, drawingStateDescription, textRenderingParams, drawingStateBlock
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
drawingStateDescription : [var] 
textRenderingParams : [comobj] 
drawingStateBlock : [comobj] 
%inst
レンダーターゲットの SaveDrawingState メソッドおよび RestoreDrawingState メソッドで使用できる
ID2D1DrawingStateBlock を作成する。


%index
ID2D1Factory_CreateWicBitmapRenderTarget
Microsoft Windows Imaging Component (WIC) ビットマップに描画するレンダーターゲットを作成する。
%group
COM misc / ID2D1Factory
%prm
this, target, renderTargetProperties, renderTarget
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
target : [comobj] 
renderTargetProperties : [var] 
renderTarget : [comobj] 
%inst
Microsoft Windows Imaging Component (WIC) ビットマップに描画するレンダーターゲットを作成する。

[備考]
アプリケーションはレンダーターゲットを一度だけ作成し、アプリケーションの寿命の間、または
[**D2DERR\_RECREATE\_TARGET**](direct2d-error-codes.md)
エラーを受け取るまで保持すべきである。このエラーを受け取った場合は、レンダーターゲット（およびそれが作成したリソース）を作成し直す必要がある。**注意**
このメソッドは Windows Phone ではサポートされておらず、デバイス上で呼び出すとエラーコード
0x8899000b（この操作に利用可能なハードウェアレンダリングデバイスがありません）で失敗する。Windows Phone
Emulator は WARP レンダリングをサポートするため、エミュレーター上で呼び出すと別のエラーコード 0x88982f80
(wincodec\_err\_unsupportedpixelformat) で失敗する。


%index
ID2D1Factory_CreateHwndRenderTarget
ウィンドウに描画するレンダーターゲットである ID2D1HwndRenderTarget を作成する。
%group
COM misc / ID2D1Factory
%prm
this, renderTargetProperties, hwndRenderTargetProperties, hwndRenderTarget
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
renderTargetProperties : [var] 
hwndRenderTargetProperties : [var] 
hwndRenderTarget : [comobj] 
%inst
ウィンドウに描画するレンダーターゲットである ID2D1HwndRenderTarget を作成する。

[備考]
レンダーターゲット作成時にハードウェアアクセラレーションが利用可能な場合、コンピューターの GPU
上にリソースが確保される。レンダーターゲットを一度だけ作成してできるだけ長く保持することで性能上の利点が得られる。アプリケーションはレンダーターゲットを一度だけ作成し、アプリケーションの寿命の間、または
[**D2DERR\_RECREATE\_TARGET**](direct2d-error-codes.md)
エラーを受け取るまで保持すべきである。このエラーを受け取った場合は、レンダーターゲット（およびそれが作成したリソース）を作成し直す必要がある。


%index
ID2D1Factory_CreateDxgiSurfaceRenderTarget
DXGI (DirectX Graphics Infrastructure) サーフェイスに描画するレンダーターゲットを作成する。(overload 1/2)
%group
COM misc / ID2D1Factory
%prm
this, dxgiSurface, renderTargetProperties, renderTarget
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
dxgiSurface : [comobj] 型: IDXGISurface* レンダーターゲットが描画する IDXGISurface。
renderTargetProperties : [var] 型: const D2D1_RENDER_TARGET_PROPERTIES & レンダリングモード、ピクセル形式、リモート化オプション、DPI 情報、およびハードウェアレンダリングに必要な DirectX の最低サポート。対応ピクセル形式については「Supported Pixel Formats and Alpha Modes」を参照。
renderTarget : [comobj] 型: ID2D1RenderTarget** このメソッドが戻ると、このメソッドが作成した ID2D1RenderTarget オブジェクトへのポインターのアドレスが格納される。
%inst
DXGI (DirectX Graphics Infrastructure)
サーフェイスに描画するレンダーターゲットを作成する。(overload 1/2)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]
Direct3D サーフェイスに書き込むには、IDXGISurface を取得して
CreateDxgiSurfaceRenderTarget メソッドに渡して DXGI
サーフェイスレンダーターゲットを作成し、それを使って DXGI サーフェイスへ 2D コンテンツを描画できる。DXGI
サーフェイスレンダーターゲットは ID2D1RenderTarget の一種であり、他の Direct2D
レンダーターゲットと同様にリソースの作成や描画コマンドの発行に使用できる。DXGI サーフェイスレンダーターゲットと DXGI
サーフェイスは同じ DXGI 形式を使用しなければならない。レンダーターゲット作成時に DXGI_FORMAT_UNKOWN
を指定すると自動的にサーフェイスの形式が使用される。DXGI サーフェイスレンダーターゲットは DXGI
サーフェイス同期を行わない。DXGI サーフェイスレンダーターゲットの作成と使用の詳細は Direct2D and Direct3D
Interoperability Overview を参照。Direct2D と連携するには、IDXGISurface を提供する
Direct3D デバイスを D3D10_CREATE_DEVICE_BGRA_SUPPORT
フラグ付きで作成する必要がある。レンダーターゲット作成時にハードウェアアクセラレーションが利用可能な場合、コンピューターの GPU
上にリソースが確保される。レンダーターゲットを一度だけ作成してできるだけ長く保持することで性能上の利点が得られる。アプリケーションはレンダーターゲットを一度だけ作成し、アプリケーションの寿命の間、またはレンダーターゲットの
EndDraw メソッドが D2DERR_RECREATE_TARGET
エラーを返すまで保持すべきである。このエラーを受け取った場合は、レンダーターゲット（およびそれが作成したリソース）を作成し直す必要がある。


%index
ID2D1Factory_CreateDCRenderTarget
Windows GDI デバイスコンテキストに描画するレンダーターゲットを作成する。
%group
COM misc / ID2D1Factory
%prm
this, renderTargetProperties, dcRenderTarget
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
renderTargetProperties : [var] 型: const D2D1_RENDER_TARGET_PROPERTIES* レンダリングモード、ピクセル形式、リモート化オプション、DPI 情報、およびハードウェアレンダリングに必要な DirectX の最低サポート。デバイスコンテキスト (DC) レンダーターゲットが GDI と連携できるようにするには、DXGI 形式を DXGI_FORMAT_B8G8R8A8_UNORM に、アルファモードを D2D1_ALPHA_MODE_PREMULTIPLIED または D2D1_ALPHA_MODE_IGNORE に設定する。ピクセル形式の詳細については「Supported Pixel Formats and Alpha Modes」を参照。
dcRenderTarget : [comobj] 型: ID2D1DCRenderTarget** このメソッドが戻ると、dcRenderTarget にはメソッドが作成した ID2D1DCRenderTarget へのポインターのアドレスが格納される。
%inst
Windows GDI デバイスコンテキストに描画するレンダーターゲットを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]
DC レンダーターゲットでレンダリングする前に、レンダーターゲットの BindDC メソッドで GDI DC
と関連付けておく必要がある。これは DC が変わるたび、および描画先領域のサイズが変わるたびに行う。DC レンダーターゲットが GDI
と連携できるようにするには、レンダーターゲットの DXGI 形式を DXGI_FORMAT_B8G8R8A8_UNORM
に、アルファモードを D2D1_ALPHA_MODE_PREMULTIPLIED または D2D1_ALPHA_MODE_IGNORE
に設定する。アプリケーションはレンダーターゲットを一度だけ作成し、アプリケーションの寿命の間、またはレンダーターゲットの EndDraw
メソッドが D2DERR_RECREATE_TARGET
エラーを返すまで保持すべきである。このエラーを受け取った場合は、レンダーターゲット（およびそれが作成したリソース）を作成し直す必要がある。


%index
ID2D1Geometry_GetFactory
ID2D1Geometry::GetFactory (vtable slot 3)
%group
COM misc / ID2D1Geometry
%prm
this, factory
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1Geometry_GetBounds
Retrieves the bounds of the geometry.
%group
COM misc / ID2D1Geometry
%prm
this, worldTransform, bounds
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
bounds : [var] 
%inst
Retrieves the bounds of the geometry.


%index
ID2D1Geometry_GetWidenedBounds
Gets the bounds of the geometry after it has been widened by the specified stroke width and style and transformed by the specified matrix.
%group
COM misc / ID2D1Geometry
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, bounds
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
bounds : [var] 
%inst
Gets the bounds of the geometry after it has been widened by the
specified stroke width and style and transformed by the specified
matrix.


%index
ID2D1Geometry_StrokeContainsPoint
Determines whether the geometry's stroke contains the specified point.
%group
COM misc / ID2D1Geometry
%prm
this, point, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
point : [int] 
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst
Determines whether the geometry's stroke contains the specified
point.


%index
ID2D1Geometry_FillContainsPoint
Indicates whether the area filled by the geometry would contain the specified point.
%group
COM misc / ID2D1Geometry
%prm
this, point, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
point : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst
Indicates whether the area filled by the geometry would contain the
specified point.


%index
ID2D1Geometry_CompareWithGeometry
Describes the intersection between this geometry and the specified geometry.
%group
COM misc / ID2D1Geometry
%prm
this, inputGeometry, inputGeometryTransform, flatteningTolerance, relation
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
relation : [var] 
%inst
Describes the intersection between this geometry and the specified
geometry.

[備考]
When interpreting the returned *relation* value, it is important to
remember that the member
[**D2D1\_GEOMETRY\_RELATION\_IS\_CONTAINED**](/windows/desktop/api/d2d1/ne-d2d1-d2d1_geometry_relation)
of the **D2D1\_GEOMETRY\_RELATION** enumeration type means that this
geometry is contained inside *inputGeometry*, not that this geometry
contains *inputGeometry*. For more information about how to interpret
other possible return values, see
[**D2D1\_GEOMETRY\_RELATION**](/windows/desktop/api/d2d1/ne-d2d1-d2d1_geometry_relation).


%index
ID2D1Geometry_Simplify
Creates a simplified version of the geometry that contains only lines and (optionally) cubic Bezier curves and writes the result to an ID2D1SimplifiedGeometrySink.
%group
COM misc / ID2D1Geometry
%prm
this, simplificationOption, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
simplificationOption : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst
Creates a simplified version of the geometry that contains only lines
and (optionally) cubic Bezier curves and writes the result to an
ID2D1SimplifiedGeometrySink.


%index
ID2D1Geometry_Tessellate
Creates a set of clockwise-wound triangles that cover the geometry after it has been transformed using the specified matrix and flattened using the specified tolerance.
%group
COM misc / ID2D1Geometry
%prm
this, worldTransform, flatteningTolerance, tessellationSink
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
tessellationSink : [comobj] 
%inst
Creates a set of clockwise-wound triangles that cover the geometry
after it has been transformed using the specified matrix and
flattened using the specified tolerance.


%index
ID2D1Geometry_CombineWithGeometry
Combines this geometry with the specified geometry and stores the result in an ID2D1SimplifiedGeometrySink.
%group
COM misc / ID2D1Geometry
%prm
this, inputGeometry, combineMode, inputGeometryTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
combineMode : [int] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst
Combines this geometry with the specified geometry and stores the
result in an ID2D1SimplifiedGeometrySink.


%index
ID2D1Geometry_Outline
Computes the outline of the geometry and writes the result to an ID2D1SimplifiedGeometrySink.
%group
COM misc / ID2D1Geometry
%prm
this, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst
Computes the outline of the geometry and writes the result to an
ID2D1SimplifiedGeometrySink.

[備考]
The
[**Outline**](/windows/win32/api/d2d1/nf-d2d1-id2d1geometry-outline(constd2d1_matrix_3x2_f__id2d1simplifiedgeometrysink))
method allows the caller to produce a geometry with an equivalent
fill to the input geometry, with the following additional properties:
- The output geometry contains no transverse intersections; that is,
segments may touch, but they never cross. - The outermost figures in
the output geometry are all oriented counterclockwise. - The output
geometry is fill-mode invariant; that is, the fill of the geometry
does not depend on the choice of the fill mode. For more information
about the fill mode, see
[**D2D1\_FILL\_MODE**](/windows/desktop/api/d2d1/ne-d2d1-d2d1_fill_mode).
Additionally, the
[**Outline**](/windows/win32/api/d2d1/nf-d2d1-id2d1geometry-outline(constd2d1_matrix_3x2_f__id2d1simplifiedgeometrysink))
method can be useful in removing redundant portions of said
geometries to simplify complex geometries. It can also be useful in
combination with
[**ID2D1GeometryGroup**](/windows/win32/api/d2d1/nn-d2d1-id2d1geometrygroup)
to create unions among several geometries simultaneously.


%index
ID2D1Geometry_ComputeArea
Computes the area of the geometry.
%group
COM misc / ID2D1Geometry
%prm
this, worldTransform, flatteningTolerance, area
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
area : [float] 
%inst
Computes the area of the geometry.


%index
ID2D1Geometry_ComputeLength
Calculates the length of the geometry as though each segment were unrolled into a line.
%group
COM misc / ID2D1Geometry
%prm
this, worldTransform, flatteningTolerance, length
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
length : [float] 
%inst
Calculates the length of the geometry as though each segment were
unrolled into a line.


%index
ID2D1Geometry_ComputePointAtLength
Calculates the point and tangent vector at the specified distance along the \ 160;geometry.
%group
COM misc / ID2D1Geometry
%prm
this, length, worldTransform, flatteningTolerance, point, unitTangentVector
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
length : [float] 
worldTransform : [var] 
flatteningTolerance : [float] 
point : [var] 
unitTangentVector : [var] 
%inst
Calculates the point and tangent vector at the specified distance
along the \ 160;geometry.


%index
ID2D1Geometry_Widen
Widens the geometry by the specified stroke and writes the result to an ID2D1SimplifiedGeometrySink.
%group
COM misc / ID2D1Geometry
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst
Widens the geometry by the specified stroke and writes the result to
an ID2D1SimplifiedGeometrySink.


%index
ID2D1GeometryGroup_GetFactory
ID2D1GeometryGroup::GetFactory (vtable slot 3)
%group
COM misc / ID2D1GeometryGroup
%prm
this, factory
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1GeometryGroup_GetBounds
ID2D1GeometryGroup::GetBounds (vtable slot 4)
%group
COM misc / ID2D1GeometryGroup
%prm
this, worldTransform, bounds
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
worldTransform : [var] 
bounds : [var] 
%inst


%index
ID2D1GeometryGroup_GetWidenedBounds
ID2D1GeometryGroup::GetWidenedBounds (vtable slot 5)
%group
COM misc / ID2D1GeometryGroup
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, bounds
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
bounds : [var] 
%inst


%index
ID2D1GeometryGroup_StrokeContainsPoint
ID2D1GeometryGroup::StrokeContainsPoint (vtable slot 6)
%group
COM misc / ID2D1GeometryGroup
%prm
this, point, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
point : [int] 
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1GeometryGroup_FillContainsPoint
ID2D1GeometryGroup::FillContainsPoint (vtable slot 7)
%group
COM misc / ID2D1GeometryGroup
%prm
this, point, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
point : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1GeometryGroup_CompareWithGeometry
ID2D1GeometryGroup::CompareWithGeometry (vtable slot 8)
%group
COM misc / ID2D1GeometryGroup
%prm
this, inputGeometry, inputGeometryTransform, flatteningTolerance, relation
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
relation : [var] 
%inst


%index
ID2D1GeometryGroup_Simplify
ID2D1GeometryGroup::Simplify (vtable slot 9)
%group
COM misc / ID2D1GeometryGroup
%prm
this, simplificationOption, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
simplificationOption : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1GeometryGroup_Tessellate
ID2D1GeometryGroup::Tessellate (vtable slot 10)
%group
COM misc / ID2D1GeometryGroup
%prm
this, worldTransform, flatteningTolerance, tessellationSink
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
tessellationSink : [comobj] 
%inst


%index
ID2D1GeometryGroup_CombineWithGeometry
ID2D1GeometryGroup::CombineWithGeometry (vtable slot 11)
%group
COM misc / ID2D1GeometryGroup
%prm
this, inputGeometry, combineMode, inputGeometryTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
combineMode : [int] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1GeometryGroup_Outline
ID2D1GeometryGroup::Outline (vtable slot 12)
%group
COM misc / ID2D1GeometryGroup
%prm
this, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1GeometryGroup_ComputeArea
ID2D1GeometryGroup::ComputeArea (vtable slot 13)
%group
COM misc / ID2D1GeometryGroup
%prm
this, worldTransform, flatteningTolerance, area
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
area : [float] 
%inst


%index
ID2D1GeometryGroup_ComputeLength
ID2D1GeometryGroup::ComputeLength (vtable slot 14)
%group
COM misc / ID2D1GeometryGroup
%prm
this, worldTransform, flatteningTolerance, length
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
length : [float] 
%inst


%index
ID2D1GeometryGroup_ComputePointAtLength
ID2D1GeometryGroup::ComputePointAtLength (vtable slot 15)
%group
COM misc / ID2D1GeometryGroup
%prm
this, length, worldTransform, flatteningTolerance, point, unitTangentVector
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
length : [float] 
worldTransform : [var] 
flatteningTolerance : [float] 
point : [var] 
unitTangentVector : [var] 
%inst


%index
ID2D1GeometryGroup_Widen
ID2D1GeometryGroup::Widen (vtable slot 16)
%group
COM misc / ID2D1GeometryGroup
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1GeometryGroup_GetFillMode
Indicates how the intersecting areas of the geometries contained in this geometry group are combined.
%group
COM misc / ID2D1GeometryGroup
%prm
this
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
%inst
Indicates how the intersecting areas of the geometries contained in
this geometry group are combined.

[戻り値]
Type: D2D1_FILL_MODE A value that indicates how the intersecting
areas of the geometries contained in this geometry group are
combined.


%index
ID2D1GeometryGroup_GetSourceGeometryCount
Indicates the number of geometry objects in the geometry group.
%group
COM misc / ID2D1GeometryGroup
%prm
this
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
%inst
Indicates the number of geometry objects in the geometry group.

[戻り値]
Type: UINT32 The number of geometries in the ID2D1GeometryGroup.


%index
ID2D1GeometryGroup_GetSourceGeometries
Retrieves the geometries in the geometry group.
%group
COM misc / ID2D1GeometryGroup
%prm
this, geometries, geometriesCount
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
geometries : [comobj] Type: const ID2D1Geometry** When this method returns, contains the address of a pointer to an array of geometries to be filled by this method. The length of the array is specified by the geometryCount parameter. If the array is NULL, then this method performs no operation. You must allocate the memory for this array.
geometriesCount : [int] Type: UINT A value indicating the number of geometries to return in the geometries array. If this value is less than the number of geometries in the geometry group, the remaining geometries are omitted. If this value is larger than the number of geometries in the geometry group, the extra geometries are set to NULL. To obtain the number of geometries currently in the geometry group, use the GetSourceGeometryCount method.
%inst
Retrieves the geometries in the geometry group.

[備考]
The returned geometries are referenced and counted, and the caller
must release them.


%index
ID2D1GeometrySink_SetFillMode
ID2D1GeometrySink::SetFillMode (vtable slot 3)
%group
COM misc / ID2D1GeometrySink
%prm
this, fillMode
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
fillMode : [int] 
%inst


%index
ID2D1GeometrySink_SetSegmentFlags
ID2D1GeometrySink::SetSegmentFlags (vtable slot 4)
%group
COM misc / ID2D1GeometrySink
%prm
this, vertexFlags
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
vertexFlags : [int] 
%inst


%index
ID2D1GeometrySink_BeginFigure
ID2D1GeometrySink::BeginFigure (vtable slot 5)
%group
COM misc / ID2D1GeometrySink
%prm
this, startPoint, figureBegin
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
startPoint : [int] 
figureBegin : [int] 
%inst


%index
ID2D1GeometrySink_AddLines
ID2D1GeometrySink::AddLines (vtable slot 6)
%group
COM misc / ID2D1GeometrySink
%prm
this, points, pointsCount
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
points : [var] 
pointsCount : [int] 
%inst


%index
ID2D1GeometrySink_AddBeziers
ID2D1GeometrySink::AddBeziers (vtable slot 7)
%group
COM misc / ID2D1GeometrySink
%prm
this, beziers, beziersCount
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
beziers : [var] 
beziersCount : [int] 
%inst


%index
ID2D1GeometrySink_EndFigure
ID2D1GeometrySink::EndFigure (vtable slot 8)
%group
COM misc / ID2D1GeometrySink
%prm
this, figureEnd
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
figureEnd : [int] 
%inst


%index
ID2D1GeometrySink_Close
ID2D1GeometrySink::Close (vtable slot 9)
%group
COM misc / ID2D1GeometrySink
%prm
this
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
%inst


%index
ID2D1GeometrySink_AddLine
Creates a line segment between the current point and the specified end point and adds it to the geometry sink.
%group
COM misc / ID2D1GeometrySink
%prm
this, point
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
point : [int] Type: D2D1_POINT_2F The end point of the line to draw.
%inst
Creates a line segment between the current point and the specified
end point and adds it to the geometry sink.


%index
ID2D1GeometrySink_AddBezier
Creates a cubic Bezier curve between the current point and the specified end point and adds it to the geometry sink.
%group
COM misc / ID2D1GeometrySink
%prm
this, bezier
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
bezier : [var] 
%inst
Creates a cubic Bezier curve between the current point and the
specified end point and adds it to the geometry sink.


%index
ID2D1GeometrySink_AddQuadraticBezier
Creates a quadratic Bezier curve between the current point and the specified end point and adds it to the geometry sink.
%group
COM misc / ID2D1GeometrySink
%prm
this, bezier
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
bezier : [var] 
%inst
Creates a quadratic Bezier curve between the current point and the
specified end point and adds it to the geometry sink.


%index
ID2D1GeometrySink_AddQuadraticBeziers
Adds a sequence of quadratic Bezier segments as an array in a single call.
%group
COM misc / ID2D1GeometrySink
%prm
this, beziers, beziersCount
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
beziers : [var] Type: const D2D1_QUADRATIC_BEZIER_SEGMENT* An array of a sequence of quadratic Bezier segments.
beziersCount : [int] Type: UINT A value indicating the number of quadratic Bezier segments in beziers.
%inst
Adds a sequence of quadratic Bezier segments as an array in a single
call.


%index
ID2D1GeometrySink_AddArc
Creates a single arc and adds it to the path geometry.
%group
COM misc / ID2D1GeometrySink
%prm
this, arc
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
arc : [var] 
%inst
Creates a single arc and adds it to the path geometry.


%index
ID2D1GradientStopCollection_GetFactory
ID2D1GradientStopCollection::GetFactory (vtable slot 3)
%group
COM misc / ID2D1GradientStopCollection
%prm
this, factory
this : [comobj] ID2D1GradientStopCollection インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1GradientStopCollection_GetGradientStopCount
Retrieves the number of gradient stops in the collection.
%group
COM misc / ID2D1GradientStopCollection
%prm
this
this : [comobj] ID2D1GradientStopCollection インターフェースの COM オブジェクト変数
%inst
Retrieves the number of gradient stops in the collection.

[戻り値]
Type: UINT32 The number of gradient stops in the collection.


%index
ID2D1GradientStopCollection_GetGradientStops
Copies the gradient stops from the collection into an array of D2D1_GRADIENT_STOP structures.
%group
COM misc / ID2D1GradientStopCollection
%prm
this, gradientStops, gradientStopsCount
this : [comobj] ID2D1GradientStopCollection インターフェースの COM オブジェクト変数
gradientStops : [var] Type: D2D1_GRADIENT_STOP* A pointer to a one-dimensional array of D2D1_GRADIENT_STOP structures. When this method returns, the array contains copies of the collection's gradient stops. You must allocate the memory for this array.
gradientStopsCount : [int] Type: UINT A value indicating the number of gradient stops to copy. If the value is less than the number of gradient stops in the collection, the remaining gradient stops are omitted. If the value is larger than the number of gradient stops in the collection, the extra gradient stops are set to NULL. To obtain the number of gradient stops in the collection, use the GetGradientStopCount method.
%inst
Copies the gradient stops from the collection into an array of
D2D1_GRADIENT_STOP structures.

[備考]
Gradient stops are copied in order of position, starting with the
gradient stop with the smallest position value and progressing to the
gradient stop with the largest position value.


%index
ID2D1GradientStopCollection_GetColorInterpolationGamma
Indicates the gamma space in which the gradient stops are interpolated.
%group
COM misc / ID2D1GradientStopCollection
%prm
this
this : [comobj] ID2D1GradientStopCollection インターフェースの COM オブジェクト変数
%inst
Indicates the gamma space in which the gradient stops are
interpolated.

[戻り値]
Type: D2D1_GAMMA The gamma space in which the gradient stops are
interpolated.


%index
ID2D1GradientStopCollection_GetExtendMode
Indicates the behavior of the gradient outside the normalized gradient range.
%group
COM misc / ID2D1GradientStopCollection
%prm
this
this : [comobj] ID2D1GradientStopCollection インターフェースの COM オブジェクト変数
%inst
Indicates the behavior of the gradient outside the normalized
gradient range.

[戻り値]
Type: D2D1_EXTEND_MODE The behavior of the gradient outside the [0,1]
normalized gradient range.


%index
ID2D1HwndRenderTarget_GetFactory
ID2D1HwndRenderTarget::GetFactory (vtable slot 3)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, factory
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateBitmap
ID2D1HwndRenderTarget::CreateBitmap (vtable slot 4)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, size, srcData, pitch, bitmapProperties, bitmap
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
size : [int] 
srcData : [intptr] 
pitch : [int] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateBitmapFromWicBitmap
ID2D1HwndRenderTarget::CreateBitmapFromWicBitmap (vtable slot 5)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, wicBitmapSource, bitmapProperties, bitmap
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
wicBitmapSource : [comobj] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateSharedBitmap
ID2D1HwndRenderTarget::CreateSharedBitmap (vtable slot 6)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, riid, data, bitmapProperties, bitmap
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
riid : [var] 
data : [intptr] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateBitmapBrush
ID2D1HwndRenderTarget::CreateBitmapBrush (vtable slot 7)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, bitmap, bitmapBrushProperties, brushProperties, bitmapBrush
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
bitmap : [comobj] 
bitmapBrushProperties : [var] 
brushProperties : [var] 
bitmapBrush : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateSolidColorBrush
ID2D1HwndRenderTarget::CreateSolidColorBrush (vtable slot 8)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, color, brushProperties, solidColorBrush
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
color : [var] 
brushProperties : [var] 
solidColorBrush : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateGradientStopCollection
ID2D1HwndRenderTarget::CreateGradientStopCollection (vtable slot 9)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, gradientStops, gradientStopsCount, colorInterpolationGamma, extendMode, gradientStopCollection
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
gradientStops : [var] 
gradientStopsCount : [int] 
colorInterpolationGamma : [int] 
extendMode : [int] 
gradientStopCollection : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateLinearGradientBrush
ID2D1HwndRenderTarget::CreateLinearGradientBrush (vtable slot 10)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, linearGradientBrushProperties, brushProperties, gradientStopCollection, linearGradientBrush
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
linearGradientBrushProperties : [var] 
brushProperties : [var] 
gradientStopCollection : [comobj] 
linearGradientBrush : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateRadialGradientBrush
ID2D1HwndRenderTarget::CreateRadialGradientBrush (vtable slot 11)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, radialGradientBrushProperties, brushProperties, gradientStopCollection, radialGradientBrush
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
radialGradientBrushProperties : [var] 
brushProperties : [var] 
gradientStopCollection : [comobj] 
radialGradientBrush : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateCompatibleRenderTarget
ID2D1HwndRenderTarget::CreateCompatibleRenderTarget (vtable slot 12)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, desiredSize, desiredPixelSize, desiredFormat, options, bitmapRenderTarget
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
desiredSize : [var] 
desiredPixelSize : [var] 
desiredFormat : [var] 
options : [int] 
bitmapRenderTarget : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateLayer
ID2D1HwndRenderTarget::CreateLayer (vtable slot 13)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, size, layer
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
size : [var] 
layer : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateMesh
ID2D1HwndRenderTarget::CreateMesh (vtable slot 14)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, mesh
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
mesh : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_DrawLine
ID2D1HwndRenderTarget::DrawLine (vtable slot 15)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, point0, point1, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
point0 : [int] 
point1 : [int] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_DrawRectangle
ID2D1HwndRenderTarget::DrawRectangle (vtable slot 16)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, rect, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
rect : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_FillRectangle
ID2D1HwndRenderTarget::FillRectangle (vtable slot 17)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, rect, brush
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
rect : [var] 
brush : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_DrawRoundedRectangle
ID2D1HwndRenderTarget::DrawRoundedRectangle (vtable slot 18)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, roundedRect, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
roundedRect : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_FillRoundedRectangle
ID2D1HwndRenderTarget::FillRoundedRectangle (vtable slot 19)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, roundedRect, brush
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
roundedRect : [var] 
brush : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_DrawEllipse
ID2D1HwndRenderTarget::DrawEllipse (vtable slot 20)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, ellipse, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
ellipse : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_FillEllipse
ID2D1HwndRenderTarget::FillEllipse (vtable slot 21)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, ellipse, brush
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
ellipse : [var] 
brush : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_DrawGeometry
ID2D1HwndRenderTarget::DrawGeometry (vtable slot 22)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, geometry, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
geometry : [comobj] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_FillGeometry
ID2D1HwndRenderTarget::FillGeometry (vtable slot 23)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, geometry, brush, opacityBrush
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
geometry : [comobj] 
brush : [comobj] 
opacityBrush : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_FillMesh
ID2D1HwndRenderTarget::FillMesh (vtable slot 24)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, mesh, brush
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
mesh : [comobj] 
brush : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_FillOpacityMask
ID2D1HwndRenderTarget::FillOpacityMask (vtable slot 25)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, opacityMask, brush, content, destinationRectangle, sourceRectangle
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
opacityMask : [comobj] 
brush : [comobj] 
content : [int] 
destinationRectangle : [var] 
sourceRectangle : [var] 
%inst


%index
ID2D1HwndRenderTarget_DrawBitmap
ID2D1HwndRenderTarget::DrawBitmap (vtable slot 26)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, bitmap, destinationRectangle, opacity, interpolationMode, sourceRectangle
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
bitmap : [comobj] 
destinationRectangle : [var] 
opacity : [float] 
interpolationMode : [int] 
sourceRectangle : [var] 
%inst


%index
ID2D1HwndRenderTarget_DrawText
ID2D1HwndRenderTarget::DrawText (vtable slot 27)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, string, stringLength, textFormat, layoutRect, defaultFillBrush, options, measuringMode
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
string : [int] 
stringLength : [int] 
textFormat : [comobj] 
layoutRect : [var] 
defaultFillBrush : [comobj] 
options : [int] 
measuringMode : [int] 
%inst


%index
ID2D1HwndRenderTarget_DrawTextLayout
ID2D1HwndRenderTarget::DrawTextLayout (vtable slot 28)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, origin, textLayout, defaultFillBrush, options
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
origin : [int] 
textLayout : [comobj] 
defaultFillBrush : [comobj] 
options : [int] 
%inst


%index
ID2D1HwndRenderTarget_DrawGlyphRun
ID2D1HwndRenderTarget::DrawGlyphRun (vtable slot 29)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, baselineOrigin, glyphRun, foregroundBrush, measuringMode
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
baselineOrigin : [int] 
glyphRun : [int] 
foregroundBrush : [comobj] 
measuringMode : [int] 
%inst


%index
ID2D1HwndRenderTarget_SetTransform
ID2D1HwndRenderTarget::SetTransform (vtable slot 30)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, transform
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1HwndRenderTarget_GetTransform
ID2D1HwndRenderTarget::GetTransform (vtable slot 31)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, transform
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1HwndRenderTarget_SetAntialiasMode
ID2D1HwndRenderTarget::SetAntialiasMode (vtable slot 32)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, antialiasMode
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
antialiasMode : [int] 
%inst


%index
ID2D1HwndRenderTarget_GetAntialiasMode
ID2D1HwndRenderTarget::GetAntialiasMode (vtable slot 33)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1HwndRenderTarget_SetTextAntialiasMode
ID2D1HwndRenderTarget::SetTextAntialiasMode (vtable slot 34)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, textAntialiasMode
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
textAntialiasMode : [int] 
%inst


%index
ID2D1HwndRenderTarget_GetTextAntialiasMode
ID2D1HwndRenderTarget::GetTextAntialiasMode (vtable slot 35)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1HwndRenderTarget_SetTextRenderingParams
ID2D1HwndRenderTarget::SetTextRenderingParams (vtable slot 36)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, textRenderingParams
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
textRenderingParams : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_GetTextRenderingParams
ID2D1HwndRenderTarget::GetTextRenderingParams (vtable slot 37)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, textRenderingParams
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
textRenderingParams : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_SetTags
ID2D1HwndRenderTarget::SetTags (vtable slot 38)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, tag1, tag2
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
tag1 : [int64] 
tag2 : [int64] 
%inst


%index
ID2D1HwndRenderTarget_GetTags
ID2D1HwndRenderTarget::GetTags (vtable slot 39)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, tag1, tag2
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 
tag2 : [var] 
%inst


%index
ID2D1HwndRenderTarget_PushLayer
ID2D1HwndRenderTarget::PushLayer (vtable slot 40)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, layerParameters, layer
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
layerParameters : [int] 
layer : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_PopLayer
ID2D1HwndRenderTarget::PopLayer (vtable slot 41)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1HwndRenderTarget_Flush
ID2D1HwndRenderTarget::Flush (vtable slot 42)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, tag1, tag2
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 
tag2 : [var] 
%inst


%index
ID2D1HwndRenderTarget_SaveDrawingState
ID2D1HwndRenderTarget::SaveDrawingState (vtable slot 43)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, drawingStateBlock
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
drawingStateBlock : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_RestoreDrawingState
ID2D1HwndRenderTarget::RestoreDrawingState (vtable slot 44)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, drawingStateBlock
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
drawingStateBlock : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_PushAxisAlignedClip
ID2D1HwndRenderTarget::PushAxisAlignedClip (vtable slot 45)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, clipRect, antialiasMode
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
clipRect : [var] 
antialiasMode : [int] 
%inst


%index
ID2D1HwndRenderTarget_PopAxisAlignedClip
ID2D1HwndRenderTarget::PopAxisAlignedClip (vtable slot 46)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1HwndRenderTarget_Clear
ID2D1HwndRenderTarget::Clear (vtable slot 47)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, clearColor
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
clearColor : [var] 
%inst


%index
ID2D1HwndRenderTarget_BeginDraw
ID2D1HwndRenderTarget::BeginDraw (vtable slot 48)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1HwndRenderTarget_EndDraw
ID2D1HwndRenderTarget::EndDraw (vtable slot 49)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, tag1, tag2
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 
tag2 : [var] 
%inst


%index
ID2D1HwndRenderTarget_GetPixelFormat
ID2D1HwndRenderTarget::GetPixelFormat (vtable slot 50)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1HwndRenderTarget_SetDpi
ID2D1HwndRenderTarget::SetDpi (vtable slot 51)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, dpiX, dpiY
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
dpiX : [float] 
dpiY : [float] 
%inst


%index
ID2D1HwndRenderTarget_GetDpi
ID2D1HwndRenderTarget::GetDpi (vtable slot 52)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, dpiX, dpiY
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
dpiX : [float] 
dpiY : [float] 
%inst


%index
ID2D1HwndRenderTarget_GetSize
ID2D1HwndRenderTarget::GetSize (vtable slot 53)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1HwndRenderTarget_GetPixelSize
ID2D1HwndRenderTarget::GetPixelSize (vtable slot 54)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1HwndRenderTarget_GetMaximumBitmapSize
ID2D1HwndRenderTarget::GetMaximumBitmapSize (vtable slot 55)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1HwndRenderTarget_IsSupported
ID2D1HwndRenderTarget::IsSupported (vtable slot 56)
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, renderTargetProperties
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
renderTargetProperties : [var] 
%inst


%index
ID2D1HwndRenderTarget_CheckWindowState
このレンダーターゲットに関連付けられた HWND がオクルードされているかどうかを示す。
%group
COM misc / ID2D1HwndRenderTarget
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst
このレンダーターゲットに関連付けられた HWND がオクルードされているかどうかを示す。

[戻り値]
型: D2D1_WINDOW_STATE このレンダーターゲットに関連付けられた HWND がオクルードされているかどうかを示す値。

[備考]
注意 前回の EndDraw 呼び出し時にウィンドウがオクルードされていた場合、現在のウィンドウ状態にかかわらず、次回
CheckWindowState を呼び出すと D2D1_WINDOW_STATE_OCCLUDED
が返る。CheckWindowState を使って現在のウィンドウ状態を判定したい場合は、EndDraw の呼び出しごとに
CheckWindowState を呼び出して戻り値を無視しておくべきである。こうすることで、次の CheckWindowState
呼び出しは実際のウィンドウ状態を返すようになる。


%index
ID2D1HwndRenderTarget_Resize
レンダーターゲットのサイズを指定したピクセルサイズに変更する。
%group
COM misc / ID2D1HwndRenderTarget
%prm
this, pixelSize
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
pixelSize : [var] 
%inst
レンダーターゲットのサイズを指定したピクセルサイズに変更する。

[備考]
このメソッドが呼び出された後、レンダーターゲット作成時に
[**D2D1\_PRESENT\_OPTIONS\_RETAIN\_CONTENTS**](/windows/win32/api/d2d1/ne-d2d1-d2d1_present_options)
オプションが指定されていたとしても、レンダーターゲットのバックバッファの内容は未定義となる。


%index
ID2D1HwndRenderTarget_GetHwnd
このレンダーターゲットに関連付けられた HWND を返す。
%group
COM misc / ID2D1HwndRenderTarget
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst
このレンダーターゲットに関連付けられた HWND を返す。

[戻り値]
型: HWND このレンダーターゲットに関連付けられた HWND。


%index
ID2D1Image_GetFactory
ID2D1Image::GetFactory (vtable slot 3)
%group
COM misc / ID2D1Image
%prm
this, factory
this : [comobj] ID2D1Image インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1Layer_GetFactory
ID2D1Layer::GetFactory (vtable slot 3)
%group
COM misc / ID2D1Layer
%prm
this, factory
this : [comobj] ID2D1Layer インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1Layer_GetSize
Gets the size of the layer in device-independent pixels.
%group
COM misc / ID2D1Layer
%prm
this
this : [comobj] ID2D1Layer インターフェースの COM オブジェクト変数
%inst
Gets the size of the layer in device-independent pixels.

[戻り値]
Type: D2D1_SIZE_F The size of the layer in device-independent pixels.


%index
ID2D1LinearGradientBrush_GetFactory
ID2D1LinearGradientBrush::GetFactory (vtable slot 3)
%group
COM misc / ID2D1LinearGradientBrush
%prm
this, factory
this : [comobj] ID2D1LinearGradientBrush インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1LinearGradientBrush_SetOpacity
ID2D1LinearGradientBrush::SetOpacity (vtable slot 4)
%group
COM misc / ID2D1LinearGradientBrush
%prm
this, opacity
this : [comobj] ID2D1LinearGradientBrush インターフェースの COM オブジェクト変数
opacity : [float] 
%inst


%index
ID2D1LinearGradientBrush_SetTransform
ID2D1LinearGradientBrush::SetTransform (vtable slot 5)
%group
COM misc / ID2D1LinearGradientBrush
%prm
this, transform
this : [comobj] ID2D1LinearGradientBrush インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1LinearGradientBrush_GetOpacity
ID2D1LinearGradientBrush::GetOpacity (vtable slot 6)
%group
COM misc / ID2D1LinearGradientBrush
%prm
this
this : [comobj] ID2D1LinearGradientBrush インターフェースの COM オブジェクト変数
%inst


%index
ID2D1LinearGradientBrush_GetTransform
ID2D1LinearGradientBrush::GetTransform (vtable slot 7)
%group
COM misc / ID2D1LinearGradientBrush
%prm
this, transform
this : [comobj] ID2D1LinearGradientBrush インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1LinearGradientBrush_SetStartPoint
Sets the starting coordinates of the linear gradient in the brush's coordinate space.
%group
COM misc / ID2D1LinearGradientBrush
%prm
this, startPoint
this : [comobj] ID2D1LinearGradientBrush インターフェースの COM オブジェクト変数
startPoint : [int] Type: D2D1_POINT_2F The starting two-dimensional coordinates of the linear gradient, in the brush's coordinate space.
%inst
Sets the starting coordinates of the linear gradient in the brush's
coordinate space.

[備考]
The start point and end point are described in the brush's space and
are mapped to the render target when the brush is used. If there is a
non-identity brush transform or render target transform, the brush's
start point and end point are also transformed.


%index
ID2D1LinearGradientBrush_SetEndPoint
Sets the ending coordinates of the linear gradient in the brush's coordinate space.
%group
COM misc / ID2D1LinearGradientBrush
%prm
this, endPoint
this : [comobj] ID2D1LinearGradientBrush インターフェースの COM オブジェクト変数
endPoint : [int] Type: D2D1_POINT_2F The ending two-dimensional coordinates of the linear gradient, in the brush's coordinate space.
%inst
Sets the ending coordinates of the linear gradient in the brush's
coordinate space.

[備考]
The start point and end point are described in the brush's space and
are mapped to the render target when the brush is used. If there is a
non-identity brush transform or render target transform, the brush's
start point and end point are also transformed.


%index
ID2D1LinearGradientBrush_GetStartPoint
Retrieves the starting coordinates of the linear gradient.
%group
COM misc / ID2D1LinearGradientBrush
%prm
this
this : [comobj] ID2D1LinearGradientBrush インターフェースの COM オブジェクト変数
%inst
Retrieves the starting coordinates of the linear gradient.

[戻り値]
Type: D2D1_POINT_2F The starting two-dimensional coordinates of the
linear gradient, in the brush's coordinate space.

[備考]
The start point and end point are described in the brush's space and
are mapped to the render target when the brush is used. If there is a
non-identity brush transform or render target transform, the brush's
start point and end point are also transformed.


%index
ID2D1LinearGradientBrush_GetEndPoint
Retrieves the ending coordinates of the linear gradient.
%group
COM misc / ID2D1LinearGradientBrush
%prm
this
this : [comobj] ID2D1LinearGradientBrush インターフェースの COM オブジェクト変数
%inst
Retrieves the ending coordinates of the linear gradient.

[戻り値]
Type: D2D1_POINT_2F The ending two-dimensional coordinates of the
linear gradient, in the brush's coordinate space.

[備考]
The start point and end point are described in the brush's space and
are mapped to the render target when the brush is used. If there is a
non-identity brush transform or render target transform, the brush's
start point and end point are also transformed.


%index
ID2D1LinearGradientBrush_GetGradientStopCollection
Retrieves the ID2D1GradientStopCollection associated with this linear gradient brush.
%group
COM misc / ID2D1LinearGradientBrush
%prm
this, gradientStopCollection
this : [comobj] ID2D1LinearGradientBrush インターフェースの COM オブジェクト変数
gradientStopCollection : [comobj] Type: ID2D1GradientStopCollection** The  ID2D1GradientStopCollection object associated with this linear gradient brush object. This parameter is passed uninitialized.
%inst
Retrieves the ID2D1GradientStopCollection associated with this linear
gradient brush.

[備考]
ID2D1GradientStopCollection contains an array of D2D1_GRADIENT_STOP
structures and information, such as the extend mode and the color
interpolation mode.


%index
ID2D1Mesh_GetFactory
ID2D1Mesh::GetFactory (vtable slot 3)
%group
COM misc / ID2D1Mesh
%prm
this, factory
this : [comobj] ID2D1Mesh インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1Mesh_Open
Opens the mesh for population.
%group
COM misc / ID2D1Mesh
%prm
this, tessellationSink
this : [comobj] ID2D1Mesh インターフェースの COM オブジェクト変数
tessellationSink : [comobj] Type: ID2D1TessellationSink** When this method returns, contains a pointer to a pointer to an ID2D1TessellationSink that is used to populate the mesh. This parameter is passed uninitialized.
%inst
Opens the mesh for population.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
error code.


%index
ID2D1PathGeometry_GetFactory
ID2D1PathGeometry::GetFactory (vtable slot 3)
%group
COM misc / ID2D1PathGeometry
%prm
this, factory
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1PathGeometry_GetBounds
ID2D1PathGeometry::GetBounds (vtable slot 4)
%group
COM misc / ID2D1PathGeometry
%prm
this, worldTransform, bounds
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
bounds : [var] 
%inst


%index
ID2D1PathGeometry_GetWidenedBounds
ID2D1PathGeometry::GetWidenedBounds (vtable slot 5)
%group
COM misc / ID2D1PathGeometry
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, bounds
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
bounds : [var] 
%inst


%index
ID2D1PathGeometry_StrokeContainsPoint
ID2D1PathGeometry::StrokeContainsPoint (vtable slot 6)
%group
COM misc / ID2D1PathGeometry
%prm
this, point, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
point : [int] 
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1PathGeometry_FillContainsPoint
ID2D1PathGeometry::FillContainsPoint (vtable slot 7)
%group
COM misc / ID2D1PathGeometry
%prm
this, point, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
point : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1PathGeometry_CompareWithGeometry
ID2D1PathGeometry::CompareWithGeometry (vtable slot 8)
%group
COM misc / ID2D1PathGeometry
%prm
this, inputGeometry, inputGeometryTransform, flatteningTolerance, relation
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
relation : [var] 
%inst


%index
ID2D1PathGeometry_Simplify
ID2D1PathGeometry::Simplify (vtable slot 9)
%group
COM misc / ID2D1PathGeometry
%prm
this, simplificationOption, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
simplificationOption : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1PathGeometry_Tessellate
ID2D1PathGeometry::Tessellate (vtable slot 10)
%group
COM misc / ID2D1PathGeometry
%prm
this, worldTransform, flatteningTolerance, tessellationSink
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
tessellationSink : [comobj] 
%inst


%index
ID2D1PathGeometry_CombineWithGeometry
ID2D1PathGeometry::CombineWithGeometry (vtable slot 11)
%group
COM misc / ID2D1PathGeometry
%prm
this, inputGeometry, combineMode, inputGeometryTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
combineMode : [int] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1PathGeometry_Outline
ID2D1PathGeometry::Outline (vtable slot 12)
%group
COM misc / ID2D1PathGeometry
%prm
this, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1PathGeometry_ComputeArea
ID2D1PathGeometry::ComputeArea (vtable slot 13)
%group
COM misc / ID2D1PathGeometry
%prm
this, worldTransform, flatteningTolerance, area
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
area : [float] 
%inst


%index
ID2D1PathGeometry_ComputeLength
ID2D1PathGeometry::ComputeLength (vtable slot 14)
%group
COM misc / ID2D1PathGeometry
%prm
this, worldTransform, flatteningTolerance, length
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
length : [float] 
%inst


%index
ID2D1PathGeometry_ComputePointAtLength
ID2D1PathGeometry::ComputePointAtLength (vtable slot 15)
%group
COM misc / ID2D1PathGeometry
%prm
this, length, worldTransform, flatteningTolerance, point, unitTangentVector
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
length : [float] 
worldTransform : [var] 
flatteningTolerance : [float] 
point : [var] 
unitTangentVector : [var] 
%inst


%index
ID2D1PathGeometry_Widen
ID2D1PathGeometry::Widen (vtable slot 16)
%group
COM misc / ID2D1PathGeometry
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1PathGeometry_Open
Retrieves the geometry sink that is used to populate the path geometry with figures and segments.
%group
COM misc / ID2D1PathGeometry
%prm
this, geometrySink
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
geometrySink : [comobj] Type: ID2D1GeometrySink** When this method returns, geometrySink contains the address of a pointer to the geometry sink that is used to populate the path geometry with figures and segments. This parameter is passed uninitialized.
%inst
Retrieves the geometry sink that is used to populate the path
geometry with figures and segments.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
error code.

[備考]
Because path geometries are immutable and can only be populated once,
it is an error to call Open on a path geometry more than once. Note
that the fill mode defaults to D2D1_FILL_MODE_ALTERNATE. To set the
fill mode, call SetFillMode before the first call to BeginFigure.
Failure to do so will put the geometry sink in an error state.


%index
ID2D1PathGeometry_Stream
Copies the contents of the path geometry to the specified ID2D1GeometrySink.
%group
COM misc / ID2D1PathGeometry
%prm
this, geometrySink
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
geometrySink : [comobj] Type: ID2D1GeometrySink* The sink to which the path geometry's contents are copied. Modifying this sink does not change the contents of this path geometry.
%inst
Copies the contents of the path geometry to the specified
ID2D1GeometrySink.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
error code.


%index
ID2D1PathGeometry_GetSegmentCount
Retrieves the number of segments in the path geometry.
%group
COM misc / ID2D1PathGeometry
%prm
this, count
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
count : [int] Type: UINT32* A pointer that receives the number of segments in the path geometry when this method returns. You must allocate storage for this parameter.
%inst
Retrieves the number of segments in the path geometry.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
error code.


%index
ID2D1PathGeometry_GetFigureCount
Retrieves the number of figures in the path geometry.
%group
COM misc / ID2D1PathGeometry
%prm
this, count
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
count : [int] Type: UINT32* A pointer that receives the number of figures in the path geometry when this method returns. You must allocate storage for this parameter.
%inst
Retrieves the number of figures in the path geometry.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
error code.


%index
ID2D1RadialGradientBrush_GetFactory
ID2D1RadialGradientBrush::GetFactory (vtable slot 3)
%group
COM misc / ID2D1RadialGradientBrush
%prm
this, factory
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1RadialGradientBrush_SetOpacity
ID2D1RadialGradientBrush::SetOpacity (vtable slot 4)
%group
COM misc / ID2D1RadialGradientBrush
%prm
this, opacity
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
opacity : [float] 
%inst


%index
ID2D1RadialGradientBrush_SetTransform
ID2D1RadialGradientBrush::SetTransform (vtable slot 5)
%group
COM misc / ID2D1RadialGradientBrush
%prm
this, transform
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1RadialGradientBrush_GetOpacity
ID2D1RadialGradientBrush::GetOpacity (vtable slot 6)
%group
COM misc / ID2D1RadialGradientBrush
%prm
this
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
%inst


%index
ID2D1RadialGradientBrush_GetTransform
ID2D1RadialGradientBrush::GetTransform (vtable slot 7)
%group
COM misc / ID2D1RadialGradientBrush
%prm
this, transform
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1RadialGradientBrush_SetCenter
Specifies the center of the gradient ellipse in the brush's coordinate space.
%group
COM misc / ID2D1RadialGradientBrush
%prm
this, center
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
center : [int] Type: D2D1_POINT_2F The center of the gradient ellipse, in the brush's coordinate space.
%inst
Specifies the center of the gradient ellipse in the brush's
coordinate space.


%index
ID2D1RadialGradientBrush_SetGradientOriginOffset
Specifies the offset of the gradient origin relative to the gradient ellipse's center.
%group
COM misc / ID2D1RadialGradientBrush
%prm
this, gradientOriginOffset
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
gradientOriginOffset : [int] Type: D2D1_POINT_2F The offset of the gradient origin from the center of the gradient ellipse.
%inst
Specifies the offset of the gradient origin relative to the gradient
ellipse's center.


%index
ID2D1RadialGradientBrush_SetRadiusX
Specifies the x-radius of the gradient ellipse, in the brush's coordinate space.
%group
COM misc / ID2D1RadialGradientBrush
%prm
this, radiusX
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
radiusX : [float] Type: FLOAT The x-radius of the gradient ellipse. This value is in the brush's coordinate space.
%inst
Specifies the x-radius of the gradient ellipse, in the brush's
coordinate space.


%index
ID2D1RadialGradientBrush_SetRadiusY
Specifies the y-radius of the gradient ellipse, in the brush's coordinate space.
%group
COM misc / ID2D1RadialGradientBrush
%prm
this, radiusY
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
radiusY : [float] Type: FLOAT The y-radius of the gradient ellipse. This value is in the brush's coordinate space.
%inst
Specifies the y-radius of the gradient ellipse, in the brush's
coordinate space.


%index
ID2D1RadialGradientBrush_GetCenter
Retrieves the center of the gradient ellipse.
%group
COM misc / ID2D1RadialGradientBrush
%prm
this
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
%inst
Retrieves the center of the gradient ellipse.

[戻り値]
Type: D2D1_POINT_2F The center of the gradient ellipse. This value is
expressed in the brush's coordinate space.


%index
ID2D1RadialGradientBrush_GetGradientOriginOffset
Retrieves the offset of the gradient origin relative to the gradient ellipse's center.
%group
COM misc / ID2D1RadialGradientBrush
%prm
this
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
%inst
Retrieves the offset of the gradient origin relative to the gradient
ellipse's center.

[戻り値]
Type: D2D1_POINT_2F The offset of the gradient origin from the center
of the gradient ellipse. This value is expressed in the brush's
coordinate space.


%index
ID2D1RadialGradientBrush_GetRadiusX
Retrieves the x-radius of the gradient ellipse.
%group
COM misc / ID2D1RadialGradientBrush
%prm
this
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
%inst
Retrieves the x-radius of the gradient ellipse.

[戻り値]
Type: FLOAT The x-radius of the gradient ellipse. This value is
expressed in the brush's coordinate space.


%index
ID2D1RadialGradientBrush_GetRadiusY
Retrieves the y-radius of the gradient ellipse.
%group
COM misc / ID2D1RadialGradientBrush
%prm
this
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
%inst
Retrieves the y-radius of the gradient ellipse.

[戻り値]
Type: FLOAT The y-radius of the gradient ellipse. This value is
expressed in the brush's coordinate space.


%index
ID2D1RadialGradientBrush_GetGradientStopCollection
Retrieves the ID2D1GradientStopCollection associated with this radial gradient brush object.
%group
COM misc / ID2D1RadialGradientBrush
%prm
this, gradientStopCollection
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
gradientStopCollection : [comobj] Type: ID2D1GradientStopCollection** The  ID2D1GradientStopCollection object associated with this linear gradient brush object. This parameter is passed uninitialized.
%inst
Retrieves the ID2D1GradientStopCollection associated with this radial
gradient brush object.

[備考]
ID2D1GradientStopCollection contains an array of D2D1_GRADIENT_STOP
structures and additional information, such as the extend mode and
the color interpolation mode.


%index
ID2D1RectangleGeometry_GetFactory
ID2D1RectangleGeometry::GetFactory (vtable slot 3)
%group
COM misc / ID2D1RectangleGeometry
%prm
this, factory
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1RectangleGeometry_GetBounds
ID2D1RectangleGeometry::GetBounds (vtable slot 4)
%group
COM misc / ID2D1RectangleGeometry
%prm
this, worldTransform, bounds
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
bounds : [var] 
%inst


%index
ID2D1RectangleGeometry_GetWidenedBounds
ID2D1RectangleGeometry::GetWidenedBounds (vtable slot 5)
%group
COM misc / ID2D1RectangleGeometry
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, bounds
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
bounds : [var] 
%inst


%index
ID2D1RectangleGeometry_StrokeContainsPoint
ID2D1RectangleGeometry::StrokeContainsPoint (vtable slot 6)
%group
COM misc / ID2D1RectangleGeometry
%prm
this, point, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
point : [int] 
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1RectangleGeometry_FillContainsPoint
ID2D1RectangleGeometry::FillContainsPoint (vtable slot 7)
%group
COM misc / ID2D1RectangleGeometry
%prm
this, point, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
point : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1RectangleGeometry_CompareWithGeometry
ID2D1RectangleGeometry::CompareWithGeometry (vtable slot 8)
%group
COM misc / ID2D1RectangleGeometry
%prm
this, inputGeometry, inputGeometryTransform, flatteningTolerance, relation
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
relation : [var] 
%inst


%index
ID2D1RectangleGeometry_Simplify
ID2D1RectangleGeometry::Simplify (vtable slot 9)
%group
COM misc / ID2D1RectangleGeometry
%prm
this, simplificationOption, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
simplificationOption : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1RectangleGeometry_Tessellate
ID2D1RectangleGeometry::Tessellate (vtable slot 10)
%group
COM misc / ID2D1RectangleGeometry
%prm
this, worldTransform, flatteningTolerance, tessellationSink
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
tessellationSink : [comobj] 
%inst


%index
ID2D1RectangleGeometry_CombineWithGeometry
ID2D1RectangleGeometry::CombineWithGeometry (vtable slot 11)
%group
COM misc / ID2D1RectangleGeometry
%prm
this, inputGeometry, combineMode, inputGeometryTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
combineMode : [int] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1RectangleGeometry_Outline
ID2D1RectangleGeometry::Outline (vtable slot 12)
%group
COM misc / ID2D1RectangleGeometry
%prm
this, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1RectangleGeometry_ComputeArea
ID2D1RectangleGeometry::ComputeArea (vtable slot 13)
%group
COM misc / ID2D1RectangleGeometry
%prm
this, worldTransform, flatteningTolerance, area
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
area : [float] 
%inst


%index
ID2D1RectangleGeometry_ComputeLength
ID2D1RectangleGeometry::ComputeLength (vtable slot 14)
%group
COM misc / ID2D1RectangleGeometry
%prm
this, worldTransform, flatteningTolerance, length
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
length : [float] 
%inst


%index
ID2D1RectangleGeometry_ComputePointAtLength
ID2D1RectangleGeometry::ComputePointAtLength (vtable slot 15)
%group
COM misc / ID2D1RectangleGeometry
%prm
this, length, worldTransform, flatteningTolerance, point, unitTangentVector
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
length : [float] 
worldTransform : [var] 
flatteningTolerance : [float] 
point : [var] 
unitTangentVector : [var] 
%inst


%index
ID2D1RectangleGeometry_Widen
ID2D1RectangleGeometry::Widen (vtable slot 16)
%group
COM misc / ID2D1RectangleGeometry
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1RectangleGeometry_GetRect
Retrieves the rectangle that describes the rectangle geometry's dimensions.
%group
COM misc / ID2D1RectangleGeometry
%prm
this, rect
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
rect : [var] Type: D2D1_RECT_F* Contains a pointer to a rectangle that describes the rectangle geometry's dimensions when this method returns. You must allocate storage for this parameter.
%inst
Retrieves the rectangle that describes the rectangle geometry's
dimensions.


%index
ID2D1RenderTarget_GetFactory
ID2D1RenderTarget::GetFactory (vtable slot 3)
%group
COM misc / ID2D1RenderTarget
%prm
this, factory
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1RenderTarget_CreateBitmap
Direct2D ビットマップを作成する。
%group
COM misc / ID2D1RenderTarget
%prm
this, size, srcData, pitch, bitmapProperties, bitmap
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
size : [int] 
srcData : [intptr] 
pitch : [int] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst
Direct2D ビットマップを作成する。


%index
ID2D1RenderTarget_CreateBitmapFromWicBitmap
指定した Microsoft Windows Imaging Component (WIC) ビットマップをコピーして ID2D1Bitmap を作成する。
%group
COM misc / ID2D1RenderTarget
%prm
this, wicBitmapSource, bitmapProperties, bitmap
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
wicBitmapSource : [comobj] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst
指定した Microsoft Windows Imaging Component (WIC) ビットマップをコピーして
ID2D1Bitmap を作成する。

[備考]
Direct2D が WIC
画像を読み込む前に、対応するピクセル形式とアルファモードへの変換が必要である。対応するピクセル形式とアルファモードの一覧については
[Supported Pixel Formats and Alpha
Modes](supported-pixel-formats-and-alpha-modes.md) を参照。


%index
ID2D1RenderTarget_CreateSharedBitmap
他のリソースとデータを共有する ID2D1Bitmap を作成する。
%group
COM misc / ID2D1RenderTarget
%prm
this, riid, data, bitmapProperties, bitmap
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
riid : [var] 型: REFIID ソースデータを提供するオブジェクトのインターフェース ID。
data : [intptr] 型: void* 新しい ID2D1Bitmap と共有するデータを含む ID2D1Bitmap、IDXGISurface、または IWICBitmapLock。詳細は Remarks を参照。
bitmapProperties : [var] 型: D2D1_BITMAP_PROPERTIES* 作成するビットマップのピクセル形式と DPI。ピクセル形式の DXGI_FORMAT 部分は data の DXGI_FORMAT と一致している必要がある（アルファモードは一致していなくてもよい）。不一致を避けるには NULL または D2D1::PixelFormat ヘルパー関数から得た値を渡せる。DPI 設定は data と一致している必要はない。dpiX と dpiY がいずれも 0.0f の場合はレンダーターゲットの DPI が使用される。
bitmap : [comobj] 型: ID2D1Bitmap** このメソッドが戻ると、新しいビットマップへのポインターのアドレスが格納される。このパラメーターは未初期化で渡される。
%inst
他のリソースとデータを共有する ID2D1Bitmap を作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]
CreateSharedBitmap メソッドはビットマップデータを効率よく再利用するのに便利で、Direct3D
との相互運用にも使える。ID2D1Bitmap の共有 リソース互換性のあるレンダーターゲットで作成された ID2D1Bitmap
を渡すことで、そのレンダーターゲットとビットマップを共有できる。元の ID2D1Bitmap とこのメソッドで作成される新しい
ID2D1Bitmap はともに同じビットマップデータを指す。レンダーターゲットリソースをいつ共有できるかについては Resources
Overview の Sharing Render Target Resources セクションを参照。既存のビットマップのデータを新しい
DPI またはアルファモードで再解釈するためにこのメソッドを使うこともできる。例えばビットマップアトラスの場合、ID2D1Bitmap
に複数のサブ画像が含まれ、それぞれ異なる D2D1_ALPHA_MODE (D2D1_ALPHA_MODE_PREMULTIPLIED
または D2D1_ALPHA_MODE_IGNORE) でレンダリングされるべきであることがある。CreateSharedBitmap
を使えばビットマップを別のコピーとしてメモリに読み込み直すことなく、望むアルファモードで再解釈できる。IDXGISurface の共有
DXGI サーフェイスレンダーターゲット（CreateDxgiSurfaceRenderTarget メソッドで作成された
ID2D1RenderTarget オブジェクト）を使用している場合、IDXGISurface サーフェイスを
CreateSharedBitmap に渡すことでビデオメモリを Direct3D と共有し、Direct3D コンテンツを
ID2D1Bitmap として操作できる。Resources Overview で説明されているとおり、レンダーターゲットと
IDXGISurface は同じ Direct3D デバイスを使用していなければならない。
同様に IDXGISurface は Supported Pixel Formats and Alpha Modes
に記載されているサポート対象のピクセル形式とアルファモードのいずれかを使用していなければならない。Direct3D
との相互運用の詳細については Direct2D and Direct3D Interoperability Overview
を参照。IWICBitmapLock の共有 IWICBitmapLock は WIC
ビットマップの内容を格納し、同時アクセスから保護する。IWICBitmapLock を CreateSharedBitmap
に渡すことで、IWICBitmapLock に既に格納されているビットマップデータを指す ID2D1Bitmap
を作成できる。CreateSharedBitmap で IWICBitmapLock
を使用するには、レンダーターゲットはソフトウェアレンダリングを使用していなければならない。レンダーターゲットにソフトウェアレンダリングを強制するには、レンダーターゲット作成時に使う
D2D1_RENDER_TARGET_PROPERTIES 構造体の type フィールドを
D2D1_RENDER_TARGET_TYPE_SOFTWARE
に設定する。既存のレンダーターゲットがソフトウェアレンダリングを使用しているかどうかを確認するには IsSupported
メソッドを使用する。


%index
ID2D1RenderTarget_CreateBitmapBrush
指定したビットマップから ID2D1BitmapBrush を作成する。
%group
COM misc / ID2D1RenderTarget
%prm
this, bitmap, bitmapBrushProperties, brushProperties, bitmapBrush
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
bitmap : [comobj] 
bitmapBrushProperties : [var] 
brushProperties : [var] 
bitmapBrush : [comobj] 
%inst
指定したビットマップから ID2D1BitmapBrush を作成する。


%index
ID2D1RenderTarget_CreateSolidColorBrush
単色で領域を塗りつぶすために使用できる新しい ID2D1SolidColorBrush を作成する。
%group
COM misc / ID2D1RenderTarget
%prm
this, color, brushProperties, solidColorBrush
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
color : [var] 
brushProperties : [var] 
solidColorBrush : [comobj] 
%inst
単色で領域を塗りつぶすために使用できる新しい ID2D1SolidColorBrush を作成する。


%index
ID2D1RenderTarget_CreateGradientStopCollection
指定した D2D1\_GRADIENT\_STOP 構造体の配列から ID2D1GradientStopCollection を作成する。
%group
COM misc / ID2D1RenderTarget
%prm
this, gradientStops, gradientStopsCount, colorInterpolationGamma, extendMode, gradientStopCollection
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
gradientStops : [var] 
gradientStopsCount : [int] 
colorInterpolationGamma : [int] 
extendMode : [int] 
gradientStopCollection : [comobj] 
%inst
指定した D2D1\_GRADIENT\_STOP 構造体の配列から ID2D1GradientStopCollection を作成する。


%index
ID2D1RenderTarget_CreateLinearGradientBrush
線形グラデーションで領域を塗りつぶすための ID2D1LinearGradientBrush オブジェクトを作成する。
%group
COM misc / ID2D1RenderTarget
%prm
this, linearGradientBrushProperties, brushProperties, gradientStopCollection, linearGradientBrush
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
linearGradientBrushProperties : [var] 
brushProperties : [var] 
gradientStopCollection : [comobj] 
linearGradientBrush : [comobj] 
%inst
線形グラデーションで領域を塗りつぶすための ID2D1LinearGradientBrush オブジェクトを作成する。


%index
ID2D1RenderTarget_CreateRadialGradientBrush
放射状グラデーションで領域を塗りつぶすために使用できる ID2D1RadialGradientBrush オブジェクトを作成する。
%group
COM misc / ID2D1RenderTarget
%prm
this, radialGradientBrushProperties, brushProperties, gradientStopCollection, radialGradientBrush
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
radialGradientBrushProperties : [var] 
brushProperties : [var] 
gradientStopCollection : [comobj] 
radialGradientBrush : [comobj] 
%inst
放射状グラデーションで領域を塗りつぶすために使用できる ID2D1RadialGradientBrush オブジェクトを作成する。


%index
ID2D1RenderTarget_CreateCompatibleRenderTarget
現在のレンダーターゲットと互換性のある、オフスクリーン中間描画用の新しいビットマップレンダーターゲットを作成する。
%group
COM misc / ID2D1RenderTarget
%prm
this, desiredSize, desiredPixelSize, desiredFormat, options, bitmapRenderTarget
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
desiredSize : [var] 
desiredPixelSize : [var] 
desiredFormat : [var] 
options : [int] 
bitmapRenderTarget : [comobj] 
%inst
現在のレンダーターゲットと互換性のある、オフスクリーン中間描画用の新しいビットマップレンダーターゲットを作成する。


%index
ID2D1RenderTarget_CreateLayer
このレンダーターゲットおよびそれと互換性のあるレンダーターゲットで使用できるレイヤーリソースを作成する。
%group
COM misc / ID2D1RenderTarget
%prm
this, size, layer
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
size : [var] 
layer : [comobj] 
%inst
このレンダーターゲットおよびそれと互換性のあるレンダーターゲットで使用できるレイヤーリソースを作成する。

[備考]
レイヤーは必要に応じて自動的にサイズ変更される。


%index
ID2D1RenderTarget_CreateMesh
三角形を使って形状を記述するメッシュを作成する。
%group
COM misc / ID2D1RenderTarget
%prm
this, mesh
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
mesh : [comobj] 型: ID2D1Mesh** このメソッドが戻ると、新しいメッシュへのポインターへのポインターが格納される。
%inst
三角形を使って形状を記述するメッシュを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]
メッシュを埋めるには Open メソッドを使って ID2D1TessellationSink
を取得する。メッシュを描画するにはレンダーターゲットの FillMesh メソッドを使用する。


%index
ID2D1RenderTarget_DrawLine
指定したストロークスタイルを使って指定した 2 点間に線を描画する。
%group
COM misc / ID2D1RenderTarget
%prm
this, point0, point1, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
point0 : [int] 型: D2D1_POINT_2F 線の始点（デバイス非依存ピクセル単位）。
point1 : [int] 型: D2D1_POINT_2F 線の終点（デバイス非依存ピクセル単位）。
brush : [comobj] 型: ID2D1Brush* 線のストロークを塗るのに使用するブラシ。
strokeWidth : [float] 型: FLOAT ストロークの幅（デバイス非依存ピクセル単位）。値は 0.0f 以上でなければならない。このパラメーターを指定しない場合の既定値は 1.0f。ストロークは線の中心に配置される。
strokeStyle : [comobj] 型: ID2D1StrokeStyle* 適用するストロークスタイル。ベタの線を描画する場合は NULL を指定する。
%inst
指定したストロークスタイルを使って指定した 2 点間に線を描画する。

[備考]
このメソッドは失敗してもエラーコードを返さない。DrawLine
のような描画操作が失敗したかどうかを判定するには、ID2D1RenderTarget::EndDraw または
ID2D1RenderTarget::Flush の戻り値を確認する。


%index
ID2D1RenderTarget_DrawRectangle
指定した寸法とストロークスタイルを持つ矩形の輪郭を描画する。
%group
COM misc / ID2D1RenderTarget
%prm
this, rect, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
rect : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst
指定した寸法とストロークスタイルを持つ矩形の輪郭を描画する。

[備考]
このメソッドは失敗してもエラーコードを返さない。**DrawRectangle**
のような描画メソッドが失敗したかどうかを判定するには、[**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw)
または
[**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush)
の戻り値を確認する。


%index
ID2D1RenderTarget_FillRectangle
指定した矩形の内部を塗りつぶす。
%group
COM misc / ID2D1RenderTarget
%prm
this, rect, brush
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
rect : [var] 
brush : [comobj] 
%inst
指定した矩形の内部を塗りつぶす。

[備考]
このメソッドは失敗してもエラーコードを返さない。**FillRectangle**
のような描画操作が失敗したかどうかを判定するには、[**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw)
または
[**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush)
の戻り値を確認する。


%index
ID2D1RenderTarget_DrawRoundedRectangle
指定したストロークスタイルを使って指定した角丸矩形の輪郭を描画する。
%group
COM misc / ID2D1RenderTarget
%prm
this, roundedRect, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
roundedRect : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst
指定したストロークスタイルを使って指定した角丸矩形の輪郭を描画する。

[備考]
このメソッドは失敗してもエラーコードを返さない。**DrawRoundedRectangle**
のような描画操作が失敗したかどうかを判定するには、[**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw)
または
[**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush)
の戻り値を確認する。


%index
ID2D1RenderTarget_FillRoundedRectangle
指定した角丸矩形の内部を塗りつぶす。
%group
COM misc / ID2D1RenderTarget
%prm
this, roundedRect, brush
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
roundedRect : [var] 
brush : [comobj] 
%inst
指定した角丸矩形の内部を塗りつぶす。

[備考]
このメソッドは失敗してもエラーコードを返さない。**FillRoundedRectangle**
のような描画操作が失敗したかどうかを判定するには、[**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw)
または
[**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush)
の戻り値を確認する。


%index
ID2D1RenderTarget_DrawEllipse
指定した寸法とストロークで楕円の輪郭を描画する。
%group
COM misc / ID2D1RenderTarget
%prm
this, ellipse, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
ellipse : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst
指定した寸法とストロークで楕円の輪郭を描画する。

[備考]
**DrawEllipse** メソッドは失敗してもエラーコードを返さない。**DrawEllipse**
のような描画操作が失敗したかどうかを判定するには、[**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw)
または
[**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush)
の戻り値を確認する。


%index
ID2D1RenderTarget_FillEllipse
指定した楕円の内部を塗りつぶす。
%group
COM misc / ID2D1RenderTarget
%prm
this, ellipse, brush
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
ellipse : [var] 
brush : [comobj] 
%inst
指定した楕円の内部を塗りつぶす。

[備考]
このメソッドは失敗してもエラーコードを返さない。**FillEllipse**
のような描画操作が失敗したかどうかを判定するには、[**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw)
または
[**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush)
の戻り値を確認する。


%index
ID2D1RenderTarget_DrawGeometry
指定したストロークスタイルを使って指定したジオメトリーの輪郭を描画する。
%group
COM misc / ID2D1RenderTarget
%prm
this, geometry, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
geometry : [comobj] 型: ID2D1Geometry* 描画するジオメトリー。
brush : [comobj] 型: ID2D1Brush* ジオメトリーのストロークを塗るのに使用するブラシ。
strokeWidth : [float] 型: FLOAT ストロークの幅（デバイス非依存ピクセル単位）。値は 0.0f 以上でなければならない。このパラメーターを指定しない場合の既定値は 1.0f。ストロークは線の中心に配置される。
strokeStyle : [comobj] 型: ID2D1StrokeStyle* ジオメトリーの輪郭に適用するストロークスタイル。ベタのストロークを描画する場合は NULL を指定する。
%inst
指定したストロークスタイルを使って指定したジオメトリーの輪郭を描画する。

[備考]
このメソッドは失敗してもエラーコードを返さない。DrawGeometry
のような描画操作が失敗したかどうかを判定するには、ID2D1RenderTarget::EndDraw または
ID2D1RenderTarget::Flush の戻り値を確認する。


%index
ID2D1RenderTarget_FillGeometry
指定したジオメトリーの内部を塗りつぶす。
%group
COM misc / ID2D1RenderTarget
%prm
this, geometry, brush, opacityBrush
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
geometry : [comobj] 型: ID2D1Geometry* 塗りつぶすジオメトリー。
brush : [comobj] 型: ID2D1Brush* ジオメトリーの内部を塗るのに使用するブラシ。
opacityBrush : [comobj] 型: ID2D1Brush* ジオメトリーに適用する不透明度マスク。不透明度マスクを使用しない場合は NULL。不透明度マスク（opacityBrush パラメーター）を指定する場合、brush は x/y 拡張モードが D2D1_EXTEND_MODE_CLAMP に設定された ID2D1BitmapBrush でなければならない。詳細は Remarks を参照。
%inst
指定したジオメトリーの内部を塗りつぶす。

[備考]
opacityBrush パラメーターが NULL でない場合、マップされた opacityBrush
の各ピクセルのアルファ値を使ってジオメトリーの対応する各ピクセルの最終的な不透明度が決定される。この処理にはブラシ内の各色のアルファ値のみが使われ、他の色情報はすべて無視される。ブラシが指定するアルファ値は、ジオメトリーが
brush で塗られた後、ジオメトリーのアルファ値に乗算される。
このメソッドは失敗してもエラーコードを返さない。FillGeometry
のような描画操作が失敗したかどうかを判定するには、ID2D1RenderTarget::EndDraw または
ID2D1RenderTarget::Flush の戻り値を確認する。


%index
ID2D1RenderTarget_FillMesh
指定したメッシュの内部を塗りつぶす。
%group
COM misc / ID2D1RenderTarget
%prm
this, mesh, brush
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
mesh : [comobj] 型: ID2D1Mesh* 塗りつぶすメッシュ。
brush : [comobj] 型: ID2D1Brush* メッシュを塗るのに使用するブラシ。
%inst
指定したメッシュの内部を塗りつぶす。

[備考]
FillMesh を呼び出す際、レンダーターゲットの現在のアンチエイリアスモードは D2D1_ANTIALIAS_MODE_ALIASED
でなければならない。レンダーターゲットのアンチエイリアスモードを変更するには SetAntialiasMode
メソッドを使用する。FillMesh は ID2D1Mesh
内の三角形に特定のワインディング順を期待しない。時計回り・反時計回りのどちらでも動作する。このメソッドは失敗してもエラーコードを返さない。FillMesh
のような描画操作が失敗したかどうかを判定するには、ID2D1RenderTarget::EndDraw または
ID2D1RenderTarget::Flush の戻り値を確認する。


%index
ID2D1RenderTarget_FillOpacityMask
指定したビットマップが記述する不透明度マスクをブラシに適用し、そのブラシを使ってレンダーターゲットの領域を塗りつぶす。
%group
COM misc / ID2D1RenderTarget
%prm
this, opacityMask, brush, content, destinationRectangle, sourceRectangle
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
opacityMask : [comobj] 
brush : [comobj] 
content : [int] 
destinationRectangle : [var] 
sourceRectangle : [var] 
%inst
指定したビットマップが記述する不透明度マスクをブラシに適用し、そのブラシを使ってレンダーターゲットの領域を塗りつぶす。

[備考]
このメソッドが正しく動作するには、レンダーターゲットが
[**D2D1\_ANTIALIAS\_MODE\_ALIASED**](/windows/desktop/api/d2d1/ne-d2d1-d2d1_antialias_mode)
アンチエイリアスモードを使用している必要がある。アンチエイリアスモードは
[**ID2D1RenderTarget::SetAntialiasMode**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-setantialiasmode)
メソッドで設定できる。このメソッドは失敗してもエラーコードを返さない。**FillOpacityMask**
のような描画操作が失敗したかどうかを判定するには、[**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw)
または
[**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush)
の戻り値を確認する。


%index
ID2D1RenderTarget_DrawBitmap
指定した ID2D1Bitmap を描画する。
%group
COM misc / ID2D1RenderTarget
%prm
this, bitmap, destinationRectangle, opacity, interpolationMode, sourceRectangle
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
bitmap : [comobj] 
destinationRectangle : [var] 
opacity : [float] 
interpolationMode : [int] 
sourceRectangle : [var] 
%inst
指定した ID2D1Bitmap を描画する。

[備考]
このメソッドは失敗してもエラーコードを返さない。**DrawBitmap**
のような描画操作が失敗したかどうかを判定するには、[**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw)
または
[**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush)
の戻り値を確認する。


%index
ID2D1RenderTarget_DrawText
IDWriteTextFormat オブジェクトが提供する書式情報を使って指定したテキストを描画する。
%group
COM misc / ID2D1RenderTarget
%prm
this, string, stringLength, textFormat, layoutRect, defaultFillBrush, options, measuringMode
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
string : [int] 
stringLength : [int] 
textFormat : [comobj] 
layoutRect : [var] 
defaultFillBrush : [comobj] 
options : [int] 
measuringMode : [int] 
%inst
IDWriteTextFormat オブジェクトが提供する書式情報を使って指定したテキストを描画する。

[備考]
Direct2D でテキストを描画するには、単一の書式のテキストには
[**ID2D1RenderTarget::DrawText**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawtext(constwchar_uint32_idwritetextformat_constd2d1_rect_f__id2d1brush_d2d1_draw_text_options_dwrite_measuring_mode))
メソッドを、複数書式・高度な OpenType 機能・ヒットテストが必要な場合は
[**ID2D1RenderTarget::DrawTextLayout**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawtextlayout)
メソッドを使用する。これらのメソッドは DirectWrite API
を利用して高品質のテキスト表示を提供する。このメソッドは失敗してもエラーコードを返さない。**DrawText**
のような描画操作が失敗したかどうかを判定するには、[**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw)
または
[**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush)
の戻り値を確認する。


%index
ID2D1RenderTarget_DrawTextLayout
指定した IDWriteTextLayout オブジェクトが記述する書式付きテキストを描画する。
%group
COM misc / ID2D1RenderTarget
%prm
this, origin, textLayout, defaultFillBrush, options
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
origin : [int] 型: D2D1_POINT_2F textLayout が記述するテキストの左上隅が描画される点（デバイス非依存ピクセル単位）。
textLayout : [comobj] 型: IDWriteTextLayout* 描画する書式付きテキスト。ID2D1Resource を継承しない描画効果は無視される。ID2D1Resource を継承するがブラシではない描画効果がある場合、このメソッドは失敗しレンダーターゲットをエラー状態にする。
defaultFillBrush : [comobj] 型: ID2D1Brush* textLayout 内で、描画効果として関連付けられたブラシ（IDWriteTextLayout::SetDrawingEffect メソッドで指定）を持たないテキストを塗るために使用するブラシ。
options : [int] 型: D2D1_DRAW_TEXT_OPTIONS テキストをピクセル境界にスナップするかどうか、およびレイアウト矩形でクリップするかどうかを示す値。既定値は D2D1_DRAW_TEXT_OPTIONS_NONE で、テキストはピクセル境界にスナップされ、レイアウト矩形ではクリップされないことを示す。
%inst
指定した IDWriteTextLayout オブジェクトが記述する書式付きテキストを描画する。

[備考]
同じテキストを繰り返し描画する場合、呼び出しごとにテキストの書式設定とレイアウト処理を必要としないため、DrawText メソッドよりも
DrawTextLayout メソッドの方が効率的である。このメソッドは失敗してもエラーコードを返さない。DrawTextLayout
のような描画操作が失敗したかどうかを判定するには、ID2D1RenderTarget::EndDraw または
ID2D1RenderTarget::Flush の戻り値を確認する。


%index
ID2D1RenderTarget_DrawGlyphRun
指定したグリフを描画する。
%group
COM misc / ID2D1RenderTarget
%prm
this, baselineOrigin, glyphRun, foregroundBrush, measuringMode
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
baselineOrigin : [int] 型: D2D1_POINT_2F グリフのベースラインの原点（デバイス非依存ピクセル単位）。
glyphRun : [int] 型: const DWRITE_GLYPH_RUN* レンダリングするグリフ。
foregroundBrush : [comobj] 型: ID2D1Brush* 指定したグリフを塗るのに使用するブラシ。
measuringMode : [int] 型: DWRITE_MEASURING_MODE テキストの書式設定時にグリフメトリックをどのように使用してテキストを測定するかを示す値。既定値は DWRITE_MEASURING_MODE_NATURAL。
%inst
指定したグリフを描画する。

[備考]
このメソッドは失敗してもエラーコードを返さない。DrawGlyphRun
のような描画操作が失敗したかどうかを判定するには、ID2D1RenderTarget::EndDraw または
ID2D1RenderTarget::Flush の戻り値を確認する。


%index
ID2D1RenderTarget_SetTransform
指定した変換をレンダーターゲットに適用し、既存の変換を置き換える。後続のすべての描画操作は変換後の空間で行われる。
%group
COM misc / ID2D1RenderTarget
%prm
this, transform
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
transform : [var] 
%inst
指定した変換をレンダーターゲットに適用し、既存の変換を置き換える。後続のすべての描画操作は変換後の空間で行われる。


%index
ID2D1RenderTarget_GetTransform
レンダーターゲットの現在の変換を取得する。
%group
COM misc / ID2D1RenderTarget
%prm
this, transform
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
transform : [var] 型: D2D1_MATRIX_3X2_F* このメソッドが戻ると、レンダーターゲットの現在の変換が格納される。このパラメーターは未初期化で渡される。
%inst
レンダーターゲットの現在の変換を取得する。


%index
ID2D1RenderTarget_SetAntialiasMode
レンダーターゲットのアンチエイリアスモードを設定する。このアンチエイリアスモードは、テキストおよびグリフ描画操作を除く後続のすべての描画操作に適用される。
%group
COM misc / ID2D1RenderTarget
%prm
this, antialiasMode
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
antialiasMode : [int] 型: D2D1_ANTIALIAS_MODE 以降の描画操作で使用するアンチエイリアスモード。
%inst

レンダーターゲットのアンチエイリアスモードを設定する。このアンチエイリアスモードは、テキストおよびグリフ描画操作を除く後続のすべての描画操作に適用される。

[備考]
テキストおよびグリフ操作のアンチエイリアスモードを指定するには SetTextAntialiasMode メソッドを使用する。


%index
ID2D1RenderTarget_GetAntialiasMode
非テキスト描画操作の現在のアンチエイリアスモードを取得する。
%group
COM misc / ID2D1RenderTarget
%prm
this
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
%inst
非テキスト描画操作の現在のアンチエイリアスモードを取得する。

[戻り値]
型: D2D1_ANTIALIAS_MODE 非テキスト描画操作の現在のアンチエイリアスモード。


%index
ID2D1RenderTarget_SetTextAntialiasMode
以降のテキストおよびグリフ描画操作で使用するアンチエイリアスモードを指定する。
%group
COM misc / ID2D1RenderTarget
%prm
this, textAntialiasMode
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
textAntialiasMode : [int] 型: D2D1_TEXT_ANTIALIAS_MODE 以降のテキストおよびグリフ描画操作で使用するアンチエイリアスモード。
%inst
以降のテキストおよびグリフ描画操作で使用するアンチエイリアスモードを指定する。


%index
ID2D1RenderTarget_GetTextAntialiasMode
テキストおよびグリフ描画操作の現在のアンチエイリアスモードを取得する。
%group
COM misc / ID2D1RenderTarget
%prm
this
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
%inst
テキストおよびグリフ描画操作の現在のアンチエイリアスモードを取得する。

[戻り値]
型: D2D1_TEXT_ANTIALIAS_MODE テキストおよびグリフ描画操作の現在のアンチエイリアスモード。


%index
ID2D1RenderTarget_SetTextRenderingParams
以降のすべてのテキストおよびグリフ描画操作に適用するテキストレンダリングオプションを指定する。
%group
COM misc / ID2D1RenderTarget
%prm
this, textRenderingParams
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
textRenderingParams : [comobj] 型: IDWriteRenderingParams* 以降のすべてのテキストおよびグリフ描画操作に適用するテキストレンダリングオプション。現在のテキストレンダリングオプションをクリアするには NULL を指定する。
%inst
以降のすべてのテキストおよびグリフ描画操作に適用するテキストレンダリングオプションを指定する。

[備考]
textRenderingParams
で指定された設定がレンダーターゲットのテキストアンチエイリアスモード（SetTextAntialiasMode
で指定）と互換性がない場合、後続のテキストおよびグリフ描画操作は失敗し、レンダーターゲットはエラー状態になる。


%index
ID2D1RenderTarget_GetTextRenderingParams
レンダーターゲットの現在のテキストレンダリングオプションを取得する。
%group
COM misc / ID2D1RenderTarget
%prm
this, textRenderingParams
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
textRenderingParams : [comobj] 型: IDWriteRenderingParams** このメソッドが戻ると、textRenderingParams にはレンダーターゲットの現在のテキストレンダリングオプションへのポインターのアドレスが格納される。
%inst
レンダーターゲットの現在のテキストレンダリングオプションを取得する。

[備考]
textRenderingParams
で指定された設定がレンダーターゲットのテキストアンチエイリアスモード（SetTextAntialiasMode
で指定）と互換性がない場合、後続のテキストおよびグリフ描画操作は失敗し、レンダーターゲットはエラー状態になる。


%index
ID2D1RenderTarget_SetTags
後続の描画操作のラベルを指定する。
%group
COM misc / ID2D1RenderTarget
%prm
this, tag1, tag2
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
tag1 : [int64] 型: D2D1_TAG 後続の描画操作に適用するラベル。
tag2 : [int64] 型: D2D1_TAG 後続の描画操作に適用するラベル。
%inst
後続の描画操作のラベルを指定する。

[備考]
このメソッドで指定したラベルはデバッグ時のエラーメッセージで出力される。タグが設定されていない場合、各タグの既定値は 0。


%index
ID2D1RenderTarget_GetTags
後続の描画操作のラベルを取得する。
%group
COM misc / ID2D1RenderTarget
%prm
this, tag1, tag2
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 型: D2D1_TAG* このメソッドが戻ると、後続の描画操作に付ける最初のラベルが格納される。このパラメーターは未初期化で渡される。NULL を指定した場合はこのパラメーターに値は取得されない。
tag2 : [var] 型: D2D1_TAG* このメソッドが戻ると、後続の描画操作に付ける 2 つ目のラベルが格納される。このパラメーターは未初期化で渡される。NULL を指定した場合はこのパラメーターに値は取得されない。
%inst
後続の描画操作のラベルを取得する。

[備考]
両方のパラメーターに同じアドレスを渡した場合、両方のパラメーターが 2 つ目のタグの値を受け取る。


%index
ID2D1RenderTarget_PushLayer
PopLayer が呼び出されるまでの後続のすべての描画操作を受け取るよう、指定したレイヤーをレンダーターゲットに追加する。(overload 1/2)
%group
COM misc / ID2D1RenderTarget
%prm
this, layerParameters, layer
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
layerParameters : [int] 型: const D2D1_LAYER_PARAMETERS* レイヤーのコンテンツ境界、ジオメトリックマスク、不透明度、不透明度マスク、およびアンチエイリアスオプション。
layer : [comobj] 型: ID2D1Layer* 後続の描画操作を受け取るレイヤー。注意 Windows 8 以降、このパラメーターは省略可能である。レイヤーを指定しない場合、Direct2D がレイヤーリソースを自動的に管理する。
%inst
PopLayer
が呼び出されるまでの後続のすべての描画操作を受け取るよう、指定したレイヤーをレンダーターゲットに追加する。(overload 1/2)

[備考]
PushLayer
メソッドは呼び出し側がレンダリングをレイヤーへリダイレクトし始めることを可能にする。レイヤー内ではすべてのレンダリング操作が有効である。レイヤーの位置はレンダーターゲットに設定されたワールド変換の影響を受ける。PushLayer
の呼び出しには対応する PopLayer の呼び出しが必要である。PopLayer の呼び出しが PushLayer
の呼び出しよりも多い場合、レンダーターゲットはエラー状態になる。未解決のレイヤーがすべてポップされる前に Flush
を呼び出すとレンダーターゲットはエラー状態になり、エラーが返される。このエラー状態は EndDraw の呼び出しでクリアできる。特定の
ID2D1Layer リソースは同時に 1 つしかアクティブにできない。つまり PushLayer
メソッドを呼び出した直後に同じレイヤーリソースで PushLayer メソッドを呼び出すことはできない。2 つ目の PushLayer
メソッドは別のレイヤーリソースで呼び出す必要がある。
このメソッドは失敗してもエラーコードを返さない。PushLayer
のような描画操作が失敗したかどうかを判定するには、ID2D1RenderTarget::EndDraw または
ID2D1RenderTarget::Flush の戻り値を確認する。


%index
ID2D1RenderTarget_PopLayer
直前の PushLayer 呼び出しで指定したレイヤーへの描画操作のリダイレクトを停止する。
%group
COM misc / ID2D1RenderTarget
%prm
this
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
%inst
直前の PushLayer 呼び出しで指定したレイヤーへの描画操作のリダイレクトを停止する。

[備考]
PopLayer は直前の PushLayer
呼び出しと対応している必要がある。このメソッドは失敗してもエラーコードを返さない。PopLayer
のような描画操作が失敗したかどうかを判定するには、ID2D1RenderTarget::EndDraw または
ID2D1RenderTarget::Flush の戻り値を確認する。


%index
ID2D1RenderTarget_Flush
保留中のすべての描画コマンドを実行する。
%group
COM misc / ID2D1RenderTarget
%prm
this, tag1, tag2
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 型: D2D1_TAG* このメソッドが戻ると、エラーを発生させた描画操作のタグ、またはエラーがなかった場合は 0 が格納される。このパラメーターは未初期化で渡される。
tag2 : [var] 型: D2D1_TAG* このメソッドが戻ると、エラーを発生させた描画操作のタグ、またはエラーがなかった場合は 0 が格納される。このパラメーターは未初期化で渡される。
%inst
保留中のすべての描画コマンドを実行する。

[戻り値]
型: HRESULT メソッドが成功した場合 S_OK を返す。そうでなければ HRESULT
エラーコードを返し、エラー発生時にアクティブだったタグを tag1 および tag2
に設定する。エラーがなかった場合、このメソッドはエラータグ状態を (0,0) に設定する。

[備考]
このコマンドはレンダーターゲットに関連付けられた Direct3D
デバイスコンテキストをフラッシュしない。このメソッドを呼び出すとレンダーターゲットのエラー状態がリセットされる。


%index
ID2D1RenderTarget_SaveDrawingState
現在の描画状態を、指定した ID2D1DrawingStateBlock に保存する。
%group
COM misc / ID2D1RenderTarget
%prm
this, drawingStateBlock
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
drawingStateBlock : [comobj] 型: ID2D1DrawingStateBlock* このメソッドが戻ると、レンダーターゲットの現在の描画状態が格納される。このパラメーターはメソッドに渡す前に初期化しておく必要がある。
%inst
現在の描画状態を、指定した ID2D1DrawingStateBlock に保存する。


%index
ID2D1RenderTarget_RestoreDrawingState
レンダーターゲットの描画状態を、指定した ID2D1DrawingStateBlock の状態に設定する。
%group
COM misc / ID2D1RenderTarget
%prm
this, drawingStateBlock
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
drawingStateBlock : [comobj] 型: ID2D1DrawingStateBlock* レンダーターゲットの新しい描画状態。
%inst
レンダーターゲットの描画状態を、指定した ID2D1DrawingStateBlock の状態に設定する。


%index
ID2D1RenderTarget_PushAxisAlignedClip
以降のすべての描画操作のクリップ先となる矩形を指定する。
%group
COM misc / ID2D1RenderTarget
%prm
this, clipRect, antialiasMode
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
clipRect : [var] 
antialiasMode : [int] 
%inst
以降のすべての描画操作のクリップ先となる矩形を指定する。

[備考]

[**PushAxisAlignedClip**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushaxisalignedclip(constd2d1_rect_f__d2d1_antialias_mode))
と
[**PopAxisAlignedClip**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-popaxisalignedclip)
のペアは
[**PushLayer**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters__id2d1layer))
と
[**PopLayer**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-poplayer)
のペアの外側または内側に出現できるが、互いに重なり合ってはならない。例えば
**PushAxisAlignedClip**、[**PushLayer**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters__id2d1layer))、**PopLayer**、**PopAxisAlignedClip**
のシーケンスは有効だが、**PushAxisAlignedClip**、**PushLayer**、**PopAxisAlignedClip**、**PopLayer**
のシーケンスは無効である。このメソッドは失敗してもエラーコードを返さない。**PushAxisAlignedClip**
のような描画操作が失敗したかどうかを判定するには、[**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw)
または
[**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush)
の戻り値を確認する。


%index
ID2D1RenderTarget_PopAxisAlignedClip
レンダーターゲットから最後の軸揃えクリップを取り除く。このメソッドを呼び出した後は、そのクリップは後続の描画操作に適用されない。
%group
COM misc / ID2D1RenderTarget
%prm
this
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
%inst
レンダーターゲットから最後の軸揃えクリップを取り除く。このメソッドを呼び出した後は、そのクリップは後続の描画操作に適用されない。

[備考]
PushAxisAlignedClip と PopAxisAlignedClip のペアは PushLayer と PopLayer
のペアの外側または内側に出現できるが、互いに重なり合ってはならない。例えば
PushAxisAlignedClip、PushLayer、PopLayer、PopAxisAlignedClip
のシーケンスは有効だが、PushAxisAlignedClip、PushLayer、PopAxisAlignedClip、PopLayer
のシーケンスは無効である。PopAxisAlignedClip は PushAxisAlignedClip の呼び出しごとに 1
回呼び出す必要がある。例については「How to Clip with an Axis-Aligned Clip
Rectangle」を参照。このメソッドは失敗してもエラーコードを返さない。PopAxisAlignedClip
のような描画操作が失敗したかどうかを判定するには、ID2D1RenderTarget::EndDraw または
ID2D1RenderTarget::Flush の戻り値を確認する。


%index
ID2D1RenderTarget_Clear
描画領域を指定した色でクリアする。
%group
COM misc / ID2D1RenderTarget
%prm
this, clearColor
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
clearColor : [var] 
%inst
描画領域を指定した色でクリアする。

[備考]
Direct2D は *clearColor*
をストレートアルファ（プリマルチプライドではない）として解釈する。レンダーターゲットのアルファモードが
[**D2D1\_ALPHA\_MODE\_IGNORE**](/windows/desktop/api/dcommon/ne-dcommon-d2d1_alpha_mode)
の場合、*clearColor* のアルファチャンネルは無視され
1.0f（完全不透明）に置き換えられる。レンダーターゲットにアクティブなクリップ（[**PushAxisAlignedClip**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushaxisalignedclip(constd2d1_rect_f__d2d1_antialias_mode))
で指定）がある場合、クリア操作はクリップ領域内のみに適用される。


%index
ID2D1RenderTarget_BeginDraw
このレンダーターゲットでの描画を開始する。
%group
COM misc / ID2D1RenderTarget
%prm
this
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
%inst
このレンダーターゲットでの描画を開始する。

[備考]
描画操作は BeginDraw と EndDraw の呼び出しの間でのみ発行できる。BeginDraw と EndDraw
は、レンダーターゲットが Direct2D システムによって使用中であることを示すために使われる。BeginDraw が呼び出されたときの
ID2D1RenderTarget の各実装の振る舞いは異なる場合がある。例えば ID2D1BitmapRenderTarget は
BeginDraw/EndDraw 呼び出しの間ロックされることがあり、DXGI サーフェイスレンダーターゲットは BeginDraw
時に取得されて EndDraw 時に解放されることがあり、ID2D1HwndRenderTarget は BeginDraw
時にバッチを開始し EndDraw 時にプレゼントすることがある。レンダリング操作を呼び出すには BeginDraw
メソッドを先に呼び出す必要があるが、状態の設定と取得は BeginDraw/EndDraw の外でも行える。BeginDraw
が呼び出されると、通常レンダーターゲットはレンダリングコマンドのバッチを蓄積するが、内部バッファがいっぱいになるか Flush
メソッドが呼び出されるか EndDraw が呼び出されるまで、これらコマンドの処理を遅延する。EndDraw
メソッドはバッチ化された描画操作を完了させ、その後操作の成否を示す HRESULT
と、オプションでエラー発生時のレンダーターゲットのタグ状態を返す。EndDraw は常に成功する。直前の EndDraw が失敗した
HRESULT を返した場合でも二度呼び出すべきではない。BeginDraw と対応しない EndDraw を呼び出すと、EndDraw
の前に BeginDraw を呼ぶ必要があることを示すエラーを返す。同一のレンダーターゲットで BeginDraw
を二度呼ぶとエラー状態になり、それ以降は何も描画されず、EndDraw が呼ばれたときに適切な HRESULT とエラー情報を返す。


%index
ID2D1RenderTarget_EndDraw
レンダーターゲットでの描画操作を終了し、現在のエラー状態と関連タグを示す。
%group
COM misc / ID2D1RenderTarget
%prm
this, tag1, tag2
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 型: D2D1_TAG* このメソッドが戻ると、エラーを発生させた描画操作のタグ、またはエラーがなかった場合は 0 が格納される。このパラメーターは未初期化で渡される。
tag2 : [var] 型: D2D1_TAG* このメソッドが戻ると、エラーを発生させた描画操作のタグ、またはエラーがなかった場合は 0 が格納される。このパラメーターは未初期化で渡される。
%inst
レンダーターゲットでの描画操作を終了し、現在のエラー状態と関連タグを示す。

[戻り値]
型: HRESULT メソッドが成功した場合 S_OK を返す。そうでなければ HRESULT
エラーコードを返し、エラー発生時にアクティブだったタグを tag1 および tag2 に設定する。

[備考]
描画操作は BeginDraw と EndDraw の呼び出しの間でのみ発行できる。
BeginDraw と EndDraw はレンダーターゲットが Direct2D
システムによって使用中であることを示すために使われる。BeginDraw が呼び出されたときの ID2D1RenderTarget
の各実装の振る舞いは異なる場合がある。例えば ID2D1BitmapRenderTarget は BeginDraw/EndDraw
呼び出しの間ロックされることがあり、DXGI サーフェイスレンダーターゲットは BeginDraw 時に取得されて EndDraw
時に解放されることがあり、ID2D1HwndRenderTarget は BeginDraw 時にバッチを開始し EndDraw
時にプレゼントすることがある。レンダリング操作を呼び出すには BeginDraw メソッドを先に呼び出す必要があるが、状態の設定と取得は
BeginDraw/EndDraw の外でも行える。BeginDraw
が呼び出されると、通常レンダーターゲットはレンダリングコマンドのバッチを蓄積するが、内部バッファがいっぱいになるか Flush
メソッドが呼び出されるか EndDraw が呼び出されるまで、これらコマンドの処理を遅延する。EndDraw
メソッドはバッチ化された描画操作を完了させ、その後操作の成否を示す HRESULT
と、オプションでエラー発生時のレンダーターゲットのタグ状態を返す。EndDraw は常に成功する。直前の EndDraw が失敗した
HRESULT を返した場合でも二度呼び出すべきではない。BeginDraw と対応しない EndDraw を呼び出すと、EndDraw
の前に BeginDraw を呼ぶ必要があることを示すエラーを返す。同一のレンダーターゲットで BeginDraw
を二度呼ぶとエラー状態になり、それ以降は何も描画されず、EndDraw が呼ばれたときに適切な HRESULT とエラー情報を返す。


%index
ID2D1RenderTarget_GetPixelFormat
レンダーターゲットのピクセル形式とアルファモードを取得する。
%group
COM misc / ID2D1RenderTarget
%prm
this
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
%inst
レンダーターゲットのピクセル形式とアルファモードを取得する。

[戻り値]
型: D2D1_PIXEL_FORMAT レンダーターゲットのピクセル形式とアルファモード。


%index
ID2D1RenderTarget_SetDpi
レンダーターゲットの DPI (dots per inch) を設定する。
%group
COM misc / ID2D1RenderTarget
%prm
this, dpiX, dpiY
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
dpiX : [float] 型: FLOAT レンダーターゲットの水平 DPI を指定する 0 以上の値。
dpiY : [float] 型: FLOAT レンダーターゲットの垂直 DPI を指定する 0 以上の値。
%inst
レンダーターゲットの DPI (dots per inch) を設定する。

[備考]
このメソッドはレンダーターゲットのピクセル空間からデバイス非依存空間へのマッピングを指定する。dpiX と dpiY がいずれも 0
の場合は、ファクトリーが読み取ったシステム DPI が選ばれる。一方が 0 でもう一方が未指定の場合、DPI
は変更されない。ID2D1HwndRenderTarget の DPI 既定値は直近にファクトリーが読み取ったシステム DPI
である。その他のレンダーターゲットの既定値は 96 DPI。


%index
ID2D1RenderTarget_GetDpi
レンダーターゲットの DPI (dots per inch) を返す。
%group
COM misc / ID2D1RenderTarget
%prm
this, dpiX, dpiY
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
dpiX : [float] 型: FLOAT* このメソッドが戻るとレンダーターゲットの水平 DPI が格納される。このパラメーターは未初期化で渡される。
dpiY : [float] 型: FLOAT* このメソッドが戻るとレンダーターゲットの垂直 DPI が格納される。このパラメーターは未初期化で渡される。
%inst
レンダーターゲットの DPI (dots per inch) を返す。

[備考]
このメソッドはレンダーターゲットのピクセル空間からデバイス非依存空間へのマッピングを示す。ID2D1HwndRenderTarget の
DPI 既定値は直近にファクトリーが読み取ったシステム DPI である。その他のレンダーターゲットの既定値は 96 DPI。


%index
ID2D1RenderTarget_GetSize
レンダーターゲットのサイズをデバイス非依存ピクセル単位で返す。
%group
COM misc / ID2D1RenderTarget
%prm
this
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
%inst
レンダーターゲットのサイズをデバイス非依存ピクセル単位で返す。

[戻り値]
型: D2D1_SIZE_F レンダーターゲットの現在のサイズ（デバイス非依存ピクセル単位）。


%index
ID2D1RenderTarget_GetPixelSize
レンダーターゲットのサイズをデバイスピクセル単位で返す。
%group
COM misc / ID2D1RenderTarget
%prm
this
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
%inst
レンダーターゲットのサイズをデバイスピクセル単位で返す。

[戻り値]
型: D2D1_SIZE_U レンダーターゲットのサイズ（デバイスピクセル単位）。


%index
ID2D1RenderTarget_GetMaximumBitmapSize
レンダーターゲットがサポートするビットマップの 1 次元あたりの最大サイズをデバイス依存単位（ピクセル）で取得する。
%group
COM misc / ID2D1RenderTarget
%prm
this
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
%inst
レンダーターゲットがサポートするビットマップの 1 次元あたりの最大サイズをデバイス依存単位（ピクセル）で取得する。

[戻り値]
型: UINT32 レンダーターゲットがサポートするビットマップの 1 次元あたりの最大サイズ（ピクセル単位）。

[備考]
このメソッドは Direct3D デバイスの最大テクスチャーサイズを返す。注意 ソフトウェアレンダラーと WARP デバイスは 16
メガピクセル (16*1024*1024) の値を返す。このサイズの Direct2D テクスチャーは作成できるが、同じサイズの
Direct3D テクスチャーは作成できない。


%index
ID2D1RenderTarget_IsSupported
レンダーターゲットが指定されたプロパティをサポートしているかどうかを示す。(overload 1/2)
%group
COM misc / ID2D1RenderTarget
%prm
this, renderTargetProperties
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
renderTargetProperties : [var] 型: const D2D1_RENDER_TARGET_PROPERTIES* テストするレンダーターゲットプロパティ。
%inst
レンダーターゲットが指定されたプロパティをサポートしているかどうかを示す。(overload 1/2)

[戻り値]
型: BOOL 指定したレンダーターゲットプロパティがこのレンダーターゲットでサポートされている場合は TRUE、そうでなければ
FALSE。

[備考]
このメソッドは renderTargetProperties パラメーターで指定された DPI 設定を評価しない。


%index
ID2D1Resource_GetFactory
Retrieves the factory associated with this resource.
%group
COM misc / ID2D1Resource
%prm
this, factory
this : [comobj] ID2D1Resource インターフェースの COM オブジェクト変数
factory : [comobj] Type: ID2D1Factory** When this method returns, contains a pointer to a pointer to the factory that created this resource. This parameter is passed uninitialized.
%inst
Retrieves the factory associated with this resource.


%index
ID2D1RoundedRectangleGeometry_GetFactory
ID2D1RoundedRectangleGeometry::GetFactory (vtable slot 3)
%group
COM misc / ID2D1RoundedRectangleGeometry
%prm
this, factory
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1RoundedRectangleGeometry_GetBounds
ID2D1RoundedRectangleGeometry::GetBounds (vtable slot 4)
%group
COM misc / ID2D1RoundedRectangleGeometry
%prm
this, worldTransform, bounds
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
bounds : [var] 
%inst


%index
ID2D1RoundedRectangleGeometry_GetWidenedBounds
ID2D1RoundedRectangleGeometry::GetWidenedBounds (vtable slot 5)
%group
COM misc / ID2D1RoundedRectangleGeometry
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, bounds
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
bounds : [var] 
%inst


%index
ID2D1RoundedRectangleGeometry_StrokeContainsPoint
ID2D1RoundedRectangleGeometry::StrokeContainsPoint (vtable slot 6)
%group
COM misc / ID2D1RoundedRectangleGeometry
%prm
this, point, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
point : [int] 
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1RoundedRectangleGeometry_FillContainsPoint
ID2D1RoundedRectangleGeometry::FillContainsPoint (vtable slot 7)
%group
COM misc / ID2D1RoundedRectangleGeometry
%prm
this, point, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
point : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1RoundedRectangleGeometry_CompareWithGeometry
ID2D1RoundedRectangleGeometry::CompareWithGeometry (vtable slot 8)
%group
COM misc / ID2D1RoundedRectangleGeometry
%prm
this, inputGeometry, inputGeometryTransform, flatteningTolerance, relation
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
relation : [var] 
%inst


%index
ID2D1RoundedRectangleGeometry_Simplify
ID2D1RoundedRectangleGeometry::Simplify (vtable slot 9)
%group
COM misc / ID2D1RoundedRectangleGeometry
%prm
this, simplificationOption, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
simplificationOption : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1RoundedRectangleGeometry_Tessellate
ID2D1RoundedRectangleGeometry::Tessellate (vtable slot 10)
%group
COM misc / ID2D1RoundedRectangleGeometry
%prm
this, worldTransform, flatteningTolerance, tessellationSink
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
tessellationSink : [comobj] 
%inst


%index
ID2D1RoundedRectangleGeometry_CombineWithGeometry
ID2D1RoundedRectangleGeometry::CombineWithGeometry (vtable slot 11)
%group
COM misc / ID2D1RoundedRectangleGeometry
%prm
this, inputGeometry, combineMode, inputGeometryTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
combineMode : [int] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1RoundedRectangleGeometry_Outline
ID2D1RoundedRectangleGeometry::Outline (vtable slot 12)
%group
COM misc / ID2D1RoundedRectangleGeometry
%prm
this, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1RoundedRectangleGeometry_ComputeArea
ID2D1RoundedRectangleGeometry::ComputeArea (vtable slot 13)
%group
COM misc / ID2D1RoundedRectangleGeometry
%prm
this, worldTransform, flatteningTolerance, area
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
area : [float] 
%inst


%index
ID2D1RoundedRectangleGeometry_ComputeLength
ID2D1RoundedRectangleGeometry::ComputeLength (vtable slot 14)
%group
COM misc / ID2D1RoundedRectangleGeometry
%prm
this, worldTransform, flatteningTolerance, length
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
length : [float] 
%inst


%index
ID2D1RoundedRectangleGeometry_ComputePointAtLength
ID2D1RoundedRectangleGeometry::ComputePointAtLength (vtable slot 15)
%group
COM misc / ID2D1RoundedRectangleGeometry
%prm
this, length, worldTransform, flatteningTolerance, point, unitTangentVector
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
length : [float] 
worldTransform : [var] 
flatteningTolerance : [float] 
point : [var] 
unitTangentVector : [var] 
%inst


%index
ID2D1RoundedRectangleGeometry_Widen
ID2D1RoundedRectangleGeometry::Widen (vtable slot 16)
%group
COM misc / ID2D1RoundedRectangleGeometry
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1RoundedRectangleGeometry_GetRoundedRect
Retrieves a rounded rectangle that describes this rounded rectangle geometry.
%group
COM misc / ID2D1RoundedRectangleGeometry
%prm
this, roundedRect
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
roundedRect : [var] Type: D2D1_ROUNDED_RECT* A pointer that receives a rounded rectangle that describes this rounded rectangle geometry. You must allocate storage for this parameter.
%inst
Retrieves a rounded rectangle that describes this rounded rectangle
geometry.


%index
ID2D1SimplifiedGeometrySink_SetFillMode
Specifies the method used to determine which points are inside the geometry described by this geometry sink and which points are outside.
%group
COM misc / ID2D1SimplifiedGeometrySink
%prm
this, fillMode
this : [comobj] ID2D1SimplifiedGeometrySink インターフェースの COM オブジェクト変数
fillMode : [int] Type: D2D1_FILL_MODE The method used to determine whether a given point is part of the geometry.
%inst
Specifies the method used to determine which points are inside the
geometry described by this geometry sink and which points are
outside.

[備考]
The fill mode defaults to D2D1_FILL_MODE_ALTERNATE. To set the fill
mode, call SetFillMode before the first call to BeginFigure. Not
doing will put the geometry sink in an error state.


%index
ID2D1SimplifiedGeometrySink_SetSegmentFlags
Specifies stroke and join options to be applied to new segments added to the geometry sink.
%group
COM misc / ID2D1SimplifiedGeometrySink
%prm
this, vertexFlags
this : [comobj] ID2D1SimplifiedGeometrySink インターフェースの COM オブジェクト変数
vertexFlags : [int] Type: D2D1_PATH_SEGMENT Stroke and join options to be applied to new segments added to the geometry sink.
%inst
Specifies stroke and join options to be applied to new segments added
to the geometry sink.

[備考]
After this method is called, the specified segment flags are applied
to each segment subsequently added to the sink. The segment flags are
applied to every additional segment until this method is called again
and a different set of segment flags is specified.


%index
ID2D1SimplifiedGeometrySink_BeginFigure
Starts a new figure at the specified point.
%group
COM misc / ID2D1SimplifiedGeometrySink
%prm
this, startPoint, figureBegin
this : [comobj] ID2D1SimplifiedGeometrySink インターフェースの COM オブジェクト変数
startPoint : [int] Type: D2D1_POINT_2F The point at which to begin the new figure.
figureBegin : [int] Type: D2D1_FIGURE_BEGIN Whether the new figure should be hollow or filled.
%inst
Starts a new figure at the specified point.

[備考]
If this method is called while a figure is currently in progress, the
interface is invalidated and all future methods will fail.


%index
ID2D1SimplifiedGeometrySink_AddLines
Creates a sequence of lines using the specified points and adds them to the geometry sink.
%group
COM misc / ID2D1SimplifiedGeometrySink
%prm
this, points, pointsCount
this : [comobj] ID2D1SimplifiedGeometrySink インターフェースの COM オブジェクト変数
points : [var] Type: const D2D1_POINT_2F* A pointer to an array of one or more points that describe the lines to draw. A line is drawn from the geometry sink's current point (the end point of the last segment drawn or the location specified by BeginFigure) to the first point in the array. if the array contains additional points, a line is drawn from the first point to the second point in the array, from the second point to the third point, and so on.
pointsCount : [int] Type: UINT The number of points in the points array.
%inst
Creates a sequence of lines using the specified points and adds them
to the geometry sink.


%index
ID2D1SimplifiedGeometrySink_AddBeziers
Creates a sequence of cubic Bezier curves and adds them to the geometry sink.
%group
COM misc / ID2D1SimplifiedGeometrySink
%prm
this, beziers, beziersCount
this : [comobj] ID2D1SimplifiedGeometrySink インターフェースの COM オブジェクト変数
beziers : [var] Type: const D2D1_BEZIER_SEGMENT* A pointer to an array of Bezier segments that describes the Bezier curves to create. A curve is drawn from the geometry sink's current point (the end point of the last segment drawn or the location specified by BeginFigure) to the end point of the first Bezier segment in the array. if the array contains additional Bezier segments, each subsequent Bezier segment uses the end point of the preceding Bezier segment as its start point.
beziersCount : [int] Type: UINT The number of Bezier segments in the beziers array.
%inst
Creates a sequence of cubic Bezier curves and adds them to the
geometry sink.


%index
ID2D1SimplifiedGeometrySink_EndFigure
Ends the current figure; optionally, closes it.
%group
COM misc / ID2D1SimplifiedGeometrySink
%prm
this, figureEnd
this : [comobj] ID2D1SimplifiedGeometrySink インターフェースの COM オブジェクト変数
figureEnd : [int] Type: D2D1_FIGURE_END A value that indicates whether the current figure is closed. If the figure is closed, a line is drawn between the current point and the start point specified by BeginFigure.
%inst
Ends the current figure; optionally, closes it.

[備考]
Calling this method without a matching call to BeginFigure places the
geometry sink in an error state; subsequent calls are ignored, and
the overall failure will be returned when the Close method is called.


%index
ID2D1SimplifiedGeometrySink_Close
Closes the geometry sink, indicates whether it is in an error state, and resets the sink's error state.
%group
COM misc / ID2D1SimplifiedGeometrySink
%prm
this
this : [comobj] ID2D1SimplifiedGeometrySink インターフェースの COM オブジェクト変数
%inst
Closes the geometry sink, indicates whether it is in an error state,
and resets the sink's error state.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
error code.

[備考]
Do not close the geometry sink while a figure is still in progress;
doing so puts the geometry sink in an error state. For the close
operation to be successful, there must be one EndFigure call for each
call to BeginFigure. After calling this method, the geometry sink
might not be usable. Direct2D implementations of this interface do
not allow the geometry sink to be modified after it is closed, but
other implementations might not impose this restriction.


%index
ID2D1SolidColorBrush_GetFactory
ID2D1SolidColorBrush::GetFactory (vtable slot 3)
%group
COM misc / ID2D1SolidColorBrush
%prm
this, factory
this : [comobj] ID2D1SolidColorBrush インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1SolidColorBrush_SetOpacity
ID2D1SolidColorBrush::SetOpacity (vtable slot 4)
%group
COM misc / ID2D1SolidColorBrush
%prm
this, opacity
this : [comobj] ID2D1SolidColorBrush インターフェースの COM オブジェクト変数
opacity : [float] 
%inst


%index
ID2D1SolidColorBrush_SetTransform
ID2D1SolidColorBrush::SetTransform (vtable slot 5)
%group
COM misc / ID2D1SolidColorBrush
%prm
this, transform
this : [comobj] ID2D1SolidColorBrush インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1SolidColorBrush_GetOpacity
ID2D1SolidColorBrush::GetOpacity (vtable slot 6)
%group
COM misc / ID2D1SolidColorBrush
%prm
this
this : [comobj] ID2D1SolidColorBrush インターフェースの COM オブジェクト変数
%inst


%index
ID2D1SolidColorBrush_GetTransform
ID2D1SolidColorBrush::GetTransform (vtable slot 7)
%group
COM misc / ID2D1SolidColorBrush
%prm
this, transform
this : [comobj] ID2D1SolidColorBrush インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1SolidColorBrush_SetColor
このソリッドカラーブラシの色を指定する。
%group
COM misc / ID2D1SolidColorBrush
%prm
this, color
this : [comobj] ID2D1SolidColorBrush インターフェースの COM オブジェクト変数
color : [var] 
%inst
このソリッドカラーブラシの色を指定する。

[備考]
色の作成を支援するため、Direct2D は
[**ColorF**](/windows/win32/api/d2d1helper/nl-d2d1helper-colorf)
クラスを提供する。このクラスは色を作成するためのヘルパーメソッドと、定義済み色のセットを提供する。


%index
ID2D1SolidColorBrush_GetColor
ソリッドカラーブラシの色を取得する。
%group
COM misc / ID2D1SolidColorBrush
%prm
this
this : [comobj] ID2D1SolidColorBrush インターフェースの COM オブジェクト変数
%inst
ソリッドカラーブラシの色を取得する。

[戻り値]
型: D2D1_COLOR_F このソリッドカラーブラシの色。


%index
ID2D1StrokeStyle_GetFactory
ID2D1StrokeStyle::GetFactory (vtable slot 3)
%group
COM misc / ID2D1StrokeStyle
%prm
this, factory
this : [comobj] ID2D1StrokeStyle インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1StrokeStyle_GetStartCap
Retrieves the type of shape used at the beginning of a stroke.
%group
COM misc / ID2D1StrokeStyle
%prm
this
this : [comobj] ID2D1StrokeStyle インターフェースの COM オブジェクト変数
%inst
Retrieves the type of shape used at the beginning of a stroke.

[戻り値]
Type: D2D1_CAP_STYLE The type of shape used at the beginning of a
stroke.


%index
ID2D1StrokeStyle_GetEndCap
Retrieves the type of shape used at the end of a stroke.
%group
COM misc / ID2D1StrokeStyle
%prm
this
this : [comobj] ID2D1StrokeStyle インターフェースの COM オブジェクト変数
%inst
Retrieves the type of shape used at the end of a stroke.

[戻り値]
Type: D2D1_CAP_STYLE The type of shape used at the end of a stroke.


%index
ID2D1StrokeStyle_GetDashCap
Gets a value that specifies how the ends of each dash are drawn.
%group
COM misc / ID2D1StrokeStyle
%prm
this
this : [comobj] ID2D1StrokeStyle インターフェースの COM オブジェクト変数
%inst
Gets a value that specifies how the ends of each dash are drawn.

[戻り値]
Type: D2D1_CAP_STYLE A value that specifies how the ends of each dash
are drawn.


%index
ID2D1StrokeStyle_GetMiterLimit
Retrieves the limit on the ratio of the miter length to half the stroke's thickness.
%group
COM misc / ID2D1StrokeStyle
%prm
this
this : [comobj] ID2D1StrokeStyle インターフェースの COM オブジェクト変数
%inst
Retrieves the limit on the ratio of the miter length to half the
stroke's thickness.

[戻り値]
Type: FLOAT A positive number greater than or equal to 1.0f that
describes the limit on the ratio of the miter length to half the
stroke's thickness.


%index
ID2D1StrokeStyle_GetLineJoin
Retrieves the type of joint used at the vertices of a shape's outline.
%group
COM misc / ID2D1StrokeStyle
%prm
this
this : [comobj] ID2D1StrokeStyle インターフェースの COM オブジェクト変数
%inst
Retrieves the type of joint used at the vertices of a shape's
outline.

[戻り値]
Type: D2D1_LINE_JOIN A value that specifies the type of joint used at
the vertices of a shape's outline.


%index
ID2D1StrokeStyle_GetDashOffset
Retrieves a value that specifies how far in the dash sequence the stroke will start.
%group
COM misc / ID2D1StrokeStyle
%prm
this
this : [comobj] ID2D1StrokeStyle インターフェースの COM オブジェクト変数
%inst
Retrieves a value that specifies how far in the dash sequence the
stroke will start.

[戻り値]
Type: FLOAT A value that specifies how far in the dash sequence the
stroke will start.


%index
ID2D1StrokeStyle_GetDashStyle
Gets a value that describes the stroke's dash pattern.
%group
COM misc / ID2D1StrokeStyle
%prm
this
this : [comobj] ID2D1StrokeStyle インターフェースの COM オブジェクト変数
%inst
Gets a value that describes the stroke's dash pattern.

[戻り値]
Type: D2D1_DASH_STYLE A value that describes the predefined dash
pattern used, or D2D1_DASH_STYLE_CUSTOM if a custom dash style is
used.

[備考]
If a custom dash style is specified, the dash pattern is described by
the dashes array, which can be retrieved by calling the GetDashes
method.


%index
ID2D1StrokeStyle_GetDashesCount
Retrieves the number of entries in the dashes array.
%group
COM misc / ID2D1StrokeStyle
%prm
this
this : [comobj] ID2D1StrokeStyle インターフェースの COM オブジェクト変数
%inst
Retrieves the number of entries in the dashes array.

[戻り値]
Type: UINT32 The number of entries in the dashes array if the stroke
is dashed; otherwise, 0.


%index
ID2D1StrokeStyle_GetDashes
Copies the dash pattern to the specified array.
%group
COM misc / ID2D1StrokeStyle
%prm
this, dashes, dashesCount
this : [comobj] ID2D1StrokeStyle インターフェースの COM オブジェクト変数
dashes : [float] Type: FLOAT* A pointer to an array that will receive the dash pattern. The array must be able to contain at least as many elements as specified by dashesCount. You must allocate storage for this array.
dashesCount : [int] Type: UINT The number of dashes to copy. If this value is less than the number of dashes in the stroke style's dashes array, the returned dashes are truncated to dashesCount. If this value is greater than the number of dashes in the stroke style's dashes array, the extra dashes are set to 0.0f. To obtain the actual number of dashes in the stroke style's dashes array, use the GetDashesCount method.
%inst
Copies the dash pattern to the specified array.

[備考]
The dashes are specified in units that are a multiple of the stroke
width, with subsequent members of the array indicating the dashes and
gaps between dashes: the first entry indicates a filled dash, the
second a gap, and so on.


%index
ID2D1TessellationSink_AddTriangles
Copies the specified triangles to the sink.
%group
COM misc / ID2D1TessellationSink
%prm
this, triangles, trianglesCount
this : [comobj] ID2D1TessellationSink インターフェースの COM オブジェクト変数
triangles : [var] Type: const D2D1_TRIANGLE* An array of D2D1_TRIANGLE structures that describe the triangles to add to the sink.
trianglesCount : [int] Type: UINT The number of triangles to copy from the triangles array.
%inst
Copies the specified triangles to the sink.


%index
ID2D1TessellationSink_Close
Closes the sink and returns its error status.
%group
COM misc / ID2D1TessellationSink
%prm
this
this : [comobj] ID2D1TessellationSink インターフェースの COM オブジェクト変数
%inst
Closes the sink and returns its error status.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
error code.


%index
ID2D1TransformedGeometry_GetFactory
ID2D1TransformedGeometry::GetFactory (vtable slot 3)
%group
COM misc / ID2D1TransformedGeometry
%prm
this, factory
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1TransformedGeometry_GetBounds
ID2D1TransformedGeometry::GetBounds (vtable slot 4)
%group
COM misc / ID2D1TransformedGeometry
%prm
this, worldTransform, bounds
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
bounds : [var] 
%inst


%index
ID2D1TransformedGeometry_GetWidenedBounds
ID2D1TransformedGeometry::GetWidenedBounds (vtable slot 5)
%group
COM misc / ID2D1TransformedGeometry
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, bounds
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
bounds : [var] 
%inst


%index
ID2D1TransformedGeometry_StrokeContainsPoint
ID2D1TransformedGeometry::StrokeContainsPoint (vtable slot 6)
%group
COM misc / ID2D1TransformedGeometry
%prm
this, point, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
point : [int] 
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1TransformedGeometry_FillContainsPoint
ID2D1TransformedGeometry::FillContainsPoint (vtable slot 7)
%group
COM misc / ID2D1TransformedGeometry
%prm
this, point, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
point : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1TransformedGeometry_CompareWithGeometry
ID2D1TransformedGeometry::CompareWithGeometry (vtable slot 8)
%group
COM misc / ID2D1TransformedGeometry
%prm
this, inputGeometry, inputGeometryTransform, flatteningTolerance, relation
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
relation : [var] 
%inst


%index
ID2D1TransformedGeometry_Simplify
ID2D1TransformedGeometry::Simplify (vtable slot 9)
%group
COM misc / ID2D1TransformedGeometry
%prm
this, simplificationOption, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
simplificationOption : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1TransformedGeometry_Tessellate
ID2D1TransformedGeometry::Tessellate (vtable slot 10)
%group
COM misc / ID2D1TransformedGeometry
%prm
this, worldTransform, flatteningTolerance, tessellationSink
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
tessellationSink : [comobj] 
%inst


%index
ID2D1TransformedGeometry_CombineWithGeometry
ID2D1TransformedGeometry::CombineWithGeometry (vtable slot 11)
%group
COM misc / ID2D1TransformedGeometry
%prm
this, inputGeometry, combineMode, inputGeometryTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
combineMode : [int] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1TransformedGeometry_Outline
ID2D1TransformedGeometry::Outline (vtable slot 12)
%group
COM misc / ID2D1TransformedGeometry
%prm
this, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1TransformedGeometry_ComputeArea
ID2D1TransformedGeometry::ComputeArea (vtable slot 13)
%group
COM misc / ID2D1TransformedGeometry
%prm
this, worldTransform, flatteningTolerance, area
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
area : [float] 
%inst


%index
ID2D1TransformedGeometry_ComputeLength
ID2D1TransformedGeometry::ComputeLength (vtable slot 14)
%group
COM misc / ID2D1TransformedGeometry
%prm
this, worldTransform, flatteningTolerance, length
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
length : [float] 
%inst


%index
ID2D1TransformedGeometry_ComputePointAtLength
ID2D1TransformedGeometry::ComputePointAtLength (vtable slot 15)
%group
COM misc / ID2D1TransformedGeometry
%prm
this, length, worldTransform, flatteningTolerance, point, unitTangentVector
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
length : [float] 
worldTransform : [var] 
flatteningTolerance : [float] 
point : [var] 
unitTangentVector : [var] 
%inst


%index
ID2D1TransformedGeometry_Widen
ID2D1TransformedGeometry::Widen (vtable slot 16)
%group
COM misc / ID2D1TransformedGeometry
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1TransformedGeometry_GetSourceGeometry
Retrieves the source geometry of this transformed geometry object.
%group
COM misc / ID2D1TransformedGeometry
%prm
this, sourceGeometry
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
sourceGeometry : [comobj] Type: ID2D1Geometry** When this method returns, contains a pointer to a pointer to the source geometry for this transformed geometry object. This parameter is passed uninitialized.
%inst
Retrieves the source geometry of this transformed geometry object.


%index
ID2D1TransformedGeometry_GetTransform
Retrieves the matrix used to transform the ID2D1TransformedGeometry object's source geometry.
%group
COM misc / ID2D1TransformedGeometry
%prm
this, transform
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
transform : [var] Type: D2D1_MATRIX_3X2_F* A pointer that receives the matrix used to transform the ID2D1TransformedGeometry object's source geometry. You must allocate storage for this parameter.
%inst
Retrieves the matrix used to transform the ID2D1TransformedGeometry
object's source geometry.


%index
IDataObject_GetData
データコンシューマーがソースデータオブジェクトからデータを取得するために呼び出す。
%group
COM misc / IDataObject
%prm
this, pformatetcIn, pmedium
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
pformatetcIn : [var] データを渡す際に使用する形式、メディウム、ターゲットデバイスを定義する FORMATETC 構造体へのポインター。ブール OR 演算子を使って複数のメディウムを指定でき、その場合メソッドは指定された中から最適なメディウムを選択できる。
pmedium : [int] tymed メンバーで返されたデータを含む記憶メディウムを示し、pUnkForRelease メンバーでメディウムの解放責任を示す STGMEDIUM 構造体へのポインター。pUnkForRelease が NULL の場合、メディウムの受け取り側が解放責任を負う。そうでない場合、pUnkForRelease は適切なオブジェクトの IUnknown を指し、その Release メソッドを呼び出せる。メディウムは GetData によって確保されデータが埋められなければならない。
%inst
データコンシューマーがソースデータオブジェクトからデータを取得するために呼び出す。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
データコンシューマーは、STGMEDIUM 構造体で定義される記憶メディウムを介してデータオブジェクトからデータを取得するために
GetData を呼び出す。呼び出し側へのメモ ブール OR 演算子で複数の許容可能な tymed メディウムを指定できる。GetData
は OR
された値からデータを最もよく表すメディウムを選択し、確保を行い、メディウムの解放責任を示さなければならない。ストリーム経由で転送されたデータは、ストリームポインターの位置
0 から現在のストリームポインター位置（終了時のストリームポインター位置）直前までに及ぶ。実装者へのメモ GetData は
FORMATETC
構造体のすべてのフィールドを確認しなければならない。要求されたアスペクトをレンダリングし、可能であれば要求されたメディウムを使用することが重要である。データオブジェクトが
FORMATETC で指定された情報に従えない場合、DV_E_FORMATETC
を返すべきである。メディウムの確保に失敗した場合、STG_E_MEDIUMFULL を返すべきである。STGMEDIUM
構造体のすべてのフィールドを埋めることが重要である。呼び出し側はデータ返却用に複数のメディウムを指定できるが、GetData
が提供できるメディウムは 1
つだけである。選択したメディウムで最初の転送が失敗した場合、エラーを返す前に指定された他のメディウムのいずれかを試すように実装できる。


%index
IDataObject_GetDataHere
データコンシューマーがソースデータオブジェクトからデータを取得するために呼び出す。このメソッドは、呼び出し側が指定した記憶メディウムの確保と解放を行わなければならない点で GetData メソッドと異なる。
%group
COM misc / IDataObject
%prm
this, pformatetc, pmedium
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
pformatetc : [var] データを渡す際に使用する形式、メディウム、ターゲットデバイスを定義する FORMATETC 構造体へのポインター。tymed には 1 つのメディウムしか指定できず、TYMED_ISTORAGE、TYMED_ISTREAM、TYMED_HGLOBAL、TYMED_FILE のみが有効である。
pmedium : [int] 転送されるデータを含む記憶メディウムを定義する STGMEDIUM 構造体へのポインター。メディウムは呼び出し側が確保し、GetDataHere が埋める。呼び出し側はメディウムの解放も行う必要がある。このメソッドの実装は、このパラメーターが指す STGMEDIUM 構造体の punkForRelease メンバーに常に NULL を設定しなければならない。
%inst

データコンシューマーがソースデータオブジェクトからデータを取得するために呼び出す。このメソッドは、呼び出し側が指定した記憶メディウムの確保と解放を行わなければならない点で
GetData メソッドと異なる。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
GetDataHere メソッドは IDataObject::GetData と似ているが、pmedium
で指定されるメディウムの確保と解放を呼び出し側が行う必要がある点が異なる。GetDataHere は FORMATETC
構造体で記述されたデータをレンダリングし、呼び出し側が提供する STGMEDIUM 構造体にデータをコピーする。例えばメディウムが
TYMED_HGLOBAL の場合、このメソッドはメディウムのサイズを変更したり新しい hGlobal
を確保したりできない。メタファイルなどの GDI 型などは GetDataHere
での使用に適さないメディウムもある。GetDataHere
メソッドは呼び出し側が提供するメタファイルにデータを格納できない。一般に、このメソッドでサポートすべき記憶メディウムは
TYMED_ISTORAGE、TYMED_ISTREAM、TYMED_FILE のみである。転送メディウムがストリームである場合、OLE
はデータが返される場所とストリームのシークポインターの位置について仮定する。GetData
の呼び出しでは、返されるデータはストリームの位置 0
からストリームの現在のシークポインター（終了時の位置）直前までである。GetDataHere
の場合、返されるデータは呼び出し時のストリームの位置から終了時の位置の直前までである。


%index
IDataObject_QueryGetData
データオブジェクトが指定どおりにデータをレンダリングできるかを判定する。貼り付けやドロップ操作を行うオブジェクトは、IDataObject::GetData を呼び出す前にこのメソッドを呼び出して操作が成功する見込みがあるかを確認できる。
%group
COM misc / IDataObject
%prm
this, pformatetc
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
pformatetc : [var] クエリに使用する形式、メディウム、ターゲットデバイスを定義する FORMATETC 構造体へのポインター。
%inst

データオブジェクトが指定どおりにデータをレンダリングできるかを判定する。貼り付けやドロップ操作を行うオブジェクトは、IDataObject::GetData
を呼び出す前にこのメソッドを呼び出して操作が成功する見込みがあるかを確認できる。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
データオブジェクトのクライアントは QueryGetData を呼び出して、指定した FORMATETC 構造体を後続の
IDataObject::GetData
の呼び出しに渡したときに成功する見込みがあるかを判定する。このメソッドからの成功戻り値は、後続の貼り付けやドロップ操作の成功を必ずしも保証しない。


%index
IDataObject_GetCanonicalFormatEtc
論理的に等価で、場合によっては異なる FORMATETC 構造体を提供する。このメソッドは 2 つの異なる FORMATETC 構造体が同じデータを返すかどうかを判定するのに使用し、重複したレンダリングを不要にする。
%group
COM misc / IDataObject
%prm
this, pformatectIn, pformatetcOut
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
pformatectIn : [var] 呼び出し側が後続の IDataObject::GetData のような呼び出しでデータを取得するために使いたい形式、メディウム、ターゲットデバイスを定義する FORMATETC 構造体へのポインター。この場合 tymed メンバーは重要ではなく、無視されるべきである。
pformatetcOut : [var] 特定のレンダリングに可能な限り一般的な情報を含み、pformatetcIn と正準的に等価となる FORMATETC 構造体へのポインター。この構造体は呼び出し側が確保し、GetCanonicalFormatEtc メソッドがデータを埋める。後続の IDataObject::GetData のような呼び出しでデータを取得する際、呼び出し側は pformatetcOut の指定値が NULL でない限りそれを使用する。この値はメソッドが DATA_S_SAMEFORMATETC を返した場合に NULL となる。この場合 tymed メンバーは重要ではなく、無視されるべきである。
%inst
論理的に等価で、場合によっては異なる FORMATETC 構造体を提供する。このメソッドは 2 つの異なる FORMATETC
構造体が同じデータを返すかどうかを判定するのに使用し、重複したレンダリングを不要にする。

[戻り値]
このメソッドは以下の値を返すことがある。
（以下省略）

[備考]
データオブジェクトが複数の要求された FORMATETC
構造体に対してまったく同じデータを供給できる場合、GetCanonicalFormatEtc は複数のより複雑な FORMATETC
構造体のセットと同じレンダリングを与える「正準」または標準の FORMATETC を供給できる。例えば、返されるデータが他の点では類似した
FORMATETC 構造体のセット内のどの 1 つで指定されたターゲットデバイスにも影響されないことはよくある。呼び出し側へのメモ 2
つの異なる FORMATETC 構造体を指定してデータオブジェクトに対して IDataObject::GetData を 2
回呼び出したときに、実際に同じレンダリングが生成されるかどうかをこのメソッドで判定できる。これにより 2
回目の呼び出しが不要になり、性能が向上する。GetCanonicalFormatEtc の呼び出しで pformatetcOut
パラメーターに正準形式が書き込まれた場合、呼び出し側はその構造体を以降の IDataObject::GetData
呼び出しで使用する。実装者へのメモ 概念的には、同じ結果を提供する正準 FORMATETC によって定義されるグループに
FORMATETC 構造体を分類できる。正準 FORMATETC
を構築するときは、特定のレンダリングを生成しつつ可能な限り一般的な情報を含むようにすべきである。デバイス固有のレンダリングを提供しないデータオブジェクトの場合、このメソッドの最も単純な実装は入力
FORMATETC を出力 FORMATETC にコピーし、出力 FORMATETC の ptd メンバーに NULL を格納して
DATA_S_SAMEFORMATETC を返すことである。


%index
IDataObject_SetData
データソースを含むオブジェクトから呼び出され、このメソッドを実装するオブジェクトにデータを転送する。
%group
COM misc / IDataObject
%prm
this, pformatetc, pmedium, fRelease
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
pformatetc : [var] 記憶メディウムに含まれるデータをデータオブジェクトが解釈する際の形式を定義する FORMATETC 構造体へのポインター。
pmedium : [int] データが渡される記憶メディウムを定義する STGMEDIUM 構造体へのポインター。
fRelease : [int] TRUE の場合、SetData を実装するデータオブジェクトは呼び出し戻り後に記憶メディウムの所有権を持つ。つまり使用後に ReleaseStgMedium 関数を呼び出してメディウムを解放しなければならない。FALSE の場合、呼び出し側は記憶メディウムの所有権を保持し、呼び出されたデータオブジェクトはこの呼び出しの間だけメディウムを使用する。
%inst
データソースを含むオブジェクトから呼び出され、このメソッドを実装するオブジェクトにデータを転送する。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
SetData
は別のオブジェクトが、実装側のデータオブジェクトにデータを送信しようと試みることを可能にする。別のオブジェクトからデータを受け取るサポートがあるデータオブジェクトはこのメソッドを実装する。サポートしない場合は
E_NOTIMPL を返すように実装すべきである。呼び出し側は pmedium
パラメーターで示される記憶メディウムを確保し、そこにデータが渡される。呼び出されたデータオブジェクトは、データを正常に受け取ってエラーコードを返さない限りデータの所有権を取得しない。fRelease
パラメーターの値は呼び出し戻り後のメディウムの所有権を示す。FALSE
は呼び出し側が依然としてメディウムを所有することを示し、データオブジェクトは呼び出し中のみ使用できる。TRUE
はデータオブジェクトが所有権を持ち、不要になった時点で解放しなければならないことを示す。pformatetc と pmedium
で指定されるメディウムの型は同じでなければならない。例えば、一方がグローバルハンドルでもう一方がストリームであってはならない。


%index
IDataObject_EnumFormatEtc
データオブジェクトがサポートする形式を列挙するオブジェクトを作成する。
%group
COM misc / IDataObject
%prm
this, dwDirection, ppenumFormatEtc
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
dwDirection : [int] データの方向。取り得る値は DATADIR 列挙子から来る。DATADIR_GET は IDataObject::GetData に渡せる形式を列挙する。DATADIR_SET は IDataObject::SetData に渡せる形式を列挙する。
ppenumFormatEtc : [comobj] 新しい列挙子オブジェクトへのインターフェースポインターを受け取る IEnumFORMATETC ポインター変数へのポインター。
%inst
データオブジェクトがサポートする形式を列挙するオブジェクトを作成する。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
EnumFormatEtc はデータオブジェクトが FORMATETC
構造体でデータを記述する際のあらゆる方法を特定するのに使用できる列挙子オブジェクトを作成し、その IEnumFORMATETC
インターフェースへのポインターを提供する。これは標準的な列挙子インターフェースの 1 つである。呼び出し側へのメモ
ポインターを取得した後、呼び出し側は IEnumFORMATETC の列挙メソッドを呼び出して FORMATETC
構造体を列挙できる。形式は時間とともに変化する可能性があるため、列挙された形式が現在サポートされているとは限らない。したがってアプリケーションは列挙を渡せる形式型のヒントとして扱うべきである。呼び出し側は列挙子の使用を終えたら
Release を呼び出す責任がある。EnumFormatEtc は以下のいずれかの動作が発生したときに呼び出される。
（以下省略）


%index
IDataObject_DAdvise
アドバイスシンクをサポートするオブジェクトから呼び出され、データオブジェクトとアドバイスシンクとの間に接続を作成する。これによりアドバイスシンクがオブジェクトのデータの変更を通知できるようになる。
%group
COM misc / IDataObject
%prm
this, pformatetc, advf, pAdvSink, pdwConnection
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
pformatetc : [var] 今後の通知で使用する形式、ターゲットデバイス、アスペクト、メディウムを定義する FORMATETC 構造体へのポインター。例えばあるシンクはデータオブジェクト内のデータのビットマップ表現が変更されたときのみ通知を受けたいかもしれない。別のシンクは同じオブジェクトのメタファイル形式にのみ関心を持つかもしれない。各アドバイスシンクは関心のあるデータが変更されたときに通知される。このデータは通知発生時にアドバイスシンクに渡される。
advf : [int] アドバイザリ接続を制御するフラグの組み合わせ。取り得る値は ADVF 列挙子から来る。ただしこのメソッドに関係するのは可能な ADVF 値の一部のみである。以下の表は関連する値を簡単に説明する。
pAdvSink : [comobj] 変更通知を受け取るアドバイスシンク上の IAdviseSink インターフェースへのポインター。
pdwConnection : [int] この接続を識別するトークン。このトークンは後でアドバイザリ接続を削除する際（IDataObject::DUnadvise に渡す）に使える。この値が 0 の場合、接続は確立されなかったことを意味する。
%inst

アドバイスシンクをサポートするオブジェクトから呼び出され、データオブジェクトとアドバイスシンクとの間に接続を作成する。これによりアドバイスシンクがオブジェクトのデータの変更を通知できるようになる。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
DAdvise
はデータオブジェクトと呼び出し側との間に変更通知接続を作成する。呼び出し側は、オブジェクトのデータが変更されたときに通知を送信できるアドバイザリシンクを提供する。単にデータ転送に使われるオブジェクトは通常アドバイザリ通知をサポートせず、DAdvise
から OLE_E_ADVISENOTSUPPORTED を返す。呼び出し側へのメモ アドバイスシンクをサポートするオブジェクトは、渡された
FORMATETC 構造体で対象の形式、アスペクト、メディウム、ターゲットデバイスを指定して DAdvise
を呼び出し、接続を確立する。データオブジェクトが要求された属性のいずれかをサポートしないか、通知の送信自体をサポートしない場合、OLE_E_ADVISENOTSUPPORTED
を返して接続を拒否できる。リンクオブジェクトのコンテナーは、バインド済みのリンクソースと直接アドバイザリ接続を確立することもできるし、接続を管理する標準
OLE
リンクオブジェクトを介して間接的に確立することもできる。バインド済みリンクソースと確立した接続は自動的に削除されない。コンテナーはアドバイザリ接続を削除するために明示的にバインド済みリンクソースで
IDataObject::DUnadvise を呼び出さなければならない。IOleLink インターフェース経由で操作される OLE
リンクオブジェクトは既定ハンドラー内に実装されている。OLE
リンクオブジェクトを介して確立された接続はリンクオブジェクトの削除時に破棄される。OLE
既定のリンクオブジェクトはリンクソースと「ワイルドカードアドバイス」を作成して、OLE
が最終変更時刻を保持できるようにする。このアドバイスは何かが変更された時刻を記録するために特別に使用される。OLE
は変更された可能性のあるすべてのデータ形式を無視し、最終変更時刻のみを記録する。ワイルドカードアドバイスを許可するには、DAdvise
の呼び出し前に FORMATETC メンバーを以下のように設定する。
（以下省略）


%index
IDataObject_DUnadvise
以前に確立された通知接続を破棄する。
%group
COM misc / IDataObject
%prm
this, dwConnection
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
dwConnection : [int] 削除する接続を示すトークン。接続確立時に IDataObject::DAdvise が返した値を使用する。
%inst
以前に確立された通知接続を破棄する。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
このメソッドは IDataObject::DAdvise の呼び出しで作成された通知を破棄する。削除対象のアドバイザリ接続が
IDataAdviseHolder::Advise への委譲によって最初に確立された場合、それを削除するには
IDataAdviseHolder::Unadvise にこの呼び出しを委譲する必要がある。


%index
IDataObject_EnumDAdvise
現在のアドバイザリ接続を列挙するために使用できるオブジェクトを作成する。
%group
COM misc / IDataObject
%prm
this, ppenumAdvise
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
ppenumAdvise : [comobj] 新しい列挙子オブジェクトへのインターフェースポインターを受け取る IEnumSTATDATA ポインター変数へのポインター。実装が *ppenumAdvise を NULL に設定した場合、現時点でアドバイスシンクへの接続が存在しないことを意味する。
%inst
現在のアドバイザリ接続を列挙するために使用できるオブジェクトを作成する。

[戻り値]
列挙子オブジェクトが正常にインスタンス化された場合、または接続が存在しない場合は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
このメソッドで作成される列挙子オブジェクトは IEnumSTATDATA インターフェースを実装する。IEnumSTATDATA は
STATDATA 構造体の配列に格納されたデータの列挙を可能にする。これらの構造体のそれぞれは 1
つのアドバイザリ接続に関する情報を提供し、FORMATETC および ADVF
情報に加えてアドバイスシンクへのポインターと接続を表すトークンを含む。呼び出し側へのメモ アドバイザリ接続の処理には OLE
のデータアドバイスホルダーオブジェクトを使うことが推奨される。CreateDataAdviseHolder
の呼び出しで取得したポインターがあれば、IDataObject::EnumDAdvise の実装は単に
IDataAdviseHolder::EnumAdvise に委譲するだけでよい。これにより列挙子が作成され、IEnumSTATDATA
の OLE 実装へのポインターが得られる。その後、そのメソッドを呼び出して現在のアドバイザリ接続を列挙できる。


%index
IDropSource_QueryContinueDrag
ドラッグ&ドロップ操作を継続するか、キャンセルするか、完了するかを判定する。このメソッドを直接呼び出すことはない。ドラッグ&ドロップ操作中に OLE DoDragDrop 関数が呼び出す。
%group
COM misc / IDropSource
%prm
this, fEscapePressed, grfKeyState
this : [comobj] IDropSource インターフェースの COM オブジェクト変数
fEscapePressed : [int] 前回の QueryContinueDrag の呼び出し以降（初回の場合は DoDragDrop 以降）に Esc キーが押されたかどうかを示す。TRUE はエンドユーザーがエスケープキーを押したことを、FALSE は押されていないことを示す。
grfKeyState : [int] キーボード上の修飾キーの現在の状態。取り得る値は MK_CONTROL、MK_SHIFT、MK_ALT、MK_BUTTON、MK_LBUTTON、MK_MBUTTON、MK_RBUTTON のいずれかの組み合わせである。
%inst

ドラッグ&ドロップ操作を継続するか、キャンセルするか、完了するかを判定する。このメソッドを直接呼び出すことはない。ドラッグ&ドロップ操作中に
OLE DoDragDrop 関数が呼び出す。

[戻り値]
このメソッドは以下の値を返すことがある。
（以下省略）

[備考]
DoDragDrop 関数はドラッグ&ドロップ操作中にキーボードやマウスボタンの状態変化を検出するたびに
QueryContinueDrag を呼び出す。QueryContinueDrag は grfKeyState および
fEscapePressed の内容に基づいて、ドラッグ&ドロップ操作を継続するか、キャンセルするか、完了するかを判定しなければならない。


%index
IDropSource_GiveFeedback
視覚効果を指定する列挙値を DoDragDrop 関数に提供することで、ドラッグ&ドロップ操作中にソースアプリケーションがエンドユーザーに視覚的なフィードバックを与えられるようにする。
%group
COM misc / IDropSource
%prm
this, dwEffect
this : [comobj] IDropSource インターフェースの COM オブジェクト変数
dwEffect : [int] IDropTarget::DragEnter、IDropTarget::DragOver、または IDropTarget::DragLeave の直近の呼び出しが返した DROPEFFECT 値。
%inst
視覚効果を指定する列挙値を DoDragDrop
関数に提供することで、ドラッグ&ドロップ操作中にソースアプリケーションがエンドユーザーに視覚的なフィードバックを与えられるようにする。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
アプリケーションがユーザーによるドラッグ&ドロップ操作の開始を検出したら、DoDragDrop
関数を呼び出すべきである。DoDragDrop はループに入り、マウスが最初にドロップターゲットウィンドウに入ったときに
IDropTarget::DragEnter を、マウスがターゲットウィンドウ内で位置を変えたときに
IDropTarget::DragOver を、マウスがターゲットウィンドウから出たときに IDropTarget::DragLeave
を呼び出す。IDropTarget::DragEnter または IDropTarget::DragOver
の呼び出しごとに、DoDragDrop はドロップターゲット呼び出しから返された DROPEFFECT 値を渡して
IDropSource::GiveFeedback を呼び出す。
マウスがターゲットウィンドウから出たとき、DoDragDrop は IDropTarget::DragLeave を呼び出す。その後
DoDragDrop は IDropSource::GiveFeedback を呼び出し、dwEffect パラメーターに
DROPEFFECT_NONE を渡す。dwEffect パラメーターには DROPEFFECT_SCROLL
を含めることができ、これはソースが適切なポインターのドラッグスクロール派生形を表示すべきであることを示す。実装者へのメモ この関数は
DoDragDrop
ループ中に頻繁に呼び出されるため、実装をできるだけ最適化することで性能面の利点を得られる。IDropSource::GiveFeedback
は dwEffect
パラメーターの値に基づいてカーソル形状を変えたり、強調表示されるソースを変えたりする責任がある。既定のカーソルを使用する場合は
DRAGDROP_S_USEDEFAULTCURSORS を返せる。そうすると OLE が既定を使ってカーソルを更新する。


%index
IDropTarget_DragEnter
ドロップが受け入れ可能かどうか、受け入れ可能な場合はドロップの効果を示す。
%group
COM misc / IDropTarget
%prm
this, pDataObj, grfKeyState, pt, pdwEffect
this : [comobj] IDropTarget インターフェースの COM オブジェクト変数
pDataObj : [comobj] データオブジェクト上の IDataObject インターフェースへのポインター。このデータオブジェクトにはドラッグ&ドロップ操作で転送されているデータが含まれる。ドロップが発生すると、このデータオブジェクトはターゲットに取り込まれる。
grfKeyState : [int] キーボード上の修飾キーの現在の状態。取り得る値は MK_CONTROL、MK_SHIFT、MK_ALT、MK_BUTTON、MK_LBUTTON、MK_MBUTTON、MK_RBUTTON のいずれかの組み合わせである。
pt : [int] 現在のカーソル位置をスクリーン座標で含む POINTL 構造体。
pdwEffect : [var] 入力時は DoDragDrop 関数の pdwEffect パラメーターの値へのポインター。戻り時はドロップ操作の結果を示す DROPEFFECT フラグのいずれかを含まなければならない。
%inst
ドロップが受け入れ可能かどうか、受け入れ可能な場合はドロップの効果を示す。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
DragEnter を直接呼び出すことはない。代わりに DoDragDrop
関数が、登録済みドロップターゲットのウィンドウにユーザーが初めてマウスをドラッグした際に、ドロップの効果を判定するために呼び出す。DragEnter
を実装するには、ソースデータオブジェクト内のデータをターゲットが使用できるかどうかを、以下の 3 点を確認することで判定する必要がある。
（以下省略）


%index
IDropTarget_DragOver
ユーザーにターゲットフィードバックを提供し、ドロップの効果を DoDragDrop 関数に伝えることで、ドロップの効果をソースに伝達させる。
%group
COM misc / IDropTarget
%prm
this, grfKeyState, pt, pdwEffect
this : [comobj] IDropTarget インターフェースの COM オブジェクト変数
grfKeyState : [int] キーボード上の修飾キーの現在の状態。有効な値は MK_CONTROL、MK_SHIFT、MK_ALT、MK_BUTTON、MK_LBUTTON、MK_MBUTTON、MK_RBUTTON のいずれかの組み合わせである。
pt : [int] 現在のカーソル位置をスクリーン座標で含む POINTL 構造体。
pdwEffect : [var] 入力時は DoDragDrop 関数の pdwEffect パラメーターの値へのポインター。戻り時はドロップ操作の結果を示す DROPEFFECT フラグのいずれかを含まなければならない。
%inst
ユーザーにターゲットフィードバックを提供し、ドロップの効果を DoDragDrop
関数に伝えることで、ドロップの効果をソースに伝達させる。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
DragOver を直接呼び出すことはない。DoDragDrop
関数はユーザーが指定したターゲットウィンドウ上でマウスを動かすたびにこのメソッドを呼び出す。ドラッグ&ドロップ操作がキャンセルされた場合、マウスがターゲットウィンドウから出た場合、またはドロップが完了した場合に
DoDragDrop はループを抜ける。IDropTarget::DragOver を実装する際は
IDropTarget::DragEnter
と同様の機能を提供しなければならない。ドロップの効果は、データオブジェクトの形式とメディウムを定義する FORMATETC
と修飾キーの状態を調べて判定しなければならない。マウス位置もドロップの効果を決定するのに使われることがある。以下の修飾キーはドロップの結果に影響する。
（以下省略）


%index
IDropTarget_DragLeave
ターゲットフィードバックを取り除き、データオブジェクトを解放する。
%group
COM misc / IDropTarget
%prm
this
this : [comobj] IDropTarget インターフェースの COM オブジェクト変数
%inst
ターゲットフィードバックを取り除き、データオブジェクトを解放する。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
このメソッドを直接呼び出すことはない。DoDragDrop 関数は以下のいずれかの場合にこのメソッドを呼び出す。
（以下省略）


%index
IDropTarget_Drop
ソースデータをターゲットウィンドウに取り込み、ターゲットフィードバックを取り除き、データオブジェクトを解放する。
%group
COM misc / IDropTarget
%prm
this, pDataObj, grfKeyState, pt, pdwEffect
this : [comobj] IDropTarget インターフェースの COM オブジェクト変数
pDataObj : [comobj] ドラッグ&ドロップ操作で転送されているデータオブジェクト上の IDataObject インターフェースへのポインター。
grfKeyState : [int] キーボード上の修飾キーの現在の状態。取り得る値は MK_CONTROL、MK_SHIFT、MK_ALT、MK_BUTTON、MK_LBUTTON、MK_MBUTTON、MK_RBUTTON のいずれかの組み合わせである。
pt : [int] 現在のカーソル位置をスクリーン座標で含む POINTL 構造体。
pdwEffect : [var] 入力時は DoDragDrop 関数の pdwEffect パラメーターの値へのポインター。戻り時はドロップ操作の結果を示す DROPEFFECT フラグのいずれかを含まなければならない。
%inst
ソースデータをターゲットウィンドウに取り込み、ターゲットフィードバックを取り除き、データオブジェクトを解放する。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
このメソッドを直接呼び出すことはない。ユーザーがドラッグ&ドロップ操作を完了したときに DoDragDrop
関数がこのメソッドを呼び出す。Drop の実装では、データオブジェクトをターゲットに取り込まなければならない。pDataObj
経由で取得できる IDataObject
で利用可能な形式と、修飾キーの現在の状態を使用して、データをリンクや埋め込みなどどのように取り込むかを決定する。データの取り込みに加えて、IDropTarget::DragLeave
メソッドと同様にクリーンアップも行う必要がある。
（以下省略）


%index
IDWriteBitmapRenderTarget_DrawGlyphRun
Draws a run of glyphs to a bitmap target at the specified position.
%group
COM misc / IDWriteBitmapRenderTarget
%prm
this, baselineOriginX, baselineOriginY, measuringMode, glyphRun, renderingParams, textColor, blackBoxRect
this : [comobj] IDWriteBitmapRenderTarget インターフェースの COM オブジェクト変数
baselineOriginX : [float] Type: FLOAT The horizontal position of the baseline origin, in DIPs, relative to the upper-left corner of the DIB.
baselineOriginY : [float] Type: FLOAT The vertical position of the baseline origin, in DIPs, relative to the upper-left corner of the DIB.
measuringMode : [int] Type: DWRITE_MEASURING_MODE The measuring method for glyphs in the run, used with the other properties to determine the rendering mode.
glyphRun : [int] Type: const DWRITE_GLYPH_RUN* The structure containing the properties of the glyph run.
renderingParams : [comobj] Type: IDWriteRenderingParams* The object that controls rendering behavior.
textColor : [int] Type: COLORREF The foreground color of the text.
blackBoxRect : [var] Type: RECT* The optional rectangle that receives the bounding box (in pixels not DIPs) of all the pixels affected by drawing the glyph run. The black box rectangle may extend beyond the dimensions of the bitmap.
%inst
Draws a run of glyphs to a bitmap target at the specified position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
You can use the IDWriteBitmapRenderTarget::DrawGlyphRun to render to
a bitmap from a custom text renderer that you implement. The custom
text renderer should call this method from within the
IDWriteTextRenderer::DrawGlyphRun callback method as shown in the
following code.
This doc was truncated.


%index
IDWriteBitmapRenderTarget_GetMemoryDC
Gets a handle to the memory device context.
%group
COM misc / IDWriteBitmapRenderTarget
%prm
this
this : [comobj] IDWriteBitmapRenderTarget インターフェースの COM オブジェクト変数
%inst
Gets a handle to the memory device context.

[戻り値]
Type: HDC Returns a device context handle to the memory device
context.

[備考]
An application can use the device context to draw using GDI
functions. An application can obtain the bitmap handle (HBITMAP) by
calling GetCurrentObject. An application that wants information about
the underlying bitmap, including a pointer to the pixel data, can
call GetObject to fill in a DIBSECTION structure. The bitmap is
always a 32-bit top-down DIB. Note that this method takes no
parameters and returns an HDC variable, not an HRESULT.
This doc was truncated.


%index
IDWriteBitmapRenderTarget_GetPixelsPerDip
Gets the number of bitmap pixels per DIP.
%group
COM misc / IDWriteBitmapRenderTarget
%prm
this
this : [comobj] IDWriteBitmapRenderTarget インターフェースの COM オブジェクト変数
%inst
Gets the number of bitmap pixels per DIP.

[戻り値]
Type: FLOAT The number of bitmap pixels per DIP.

[備考]
A DIP (device-independent pixel) is 1/96 inch. Therefore, this value
is the number if pixels per inch divided by 96.


%index
IDWriteBitmapRenderTarget_SetPixelsPerDip
Sets the number of bitmap pixels per DIP (device-independent pixel). A DIP is 1/96 inch, so this value is the number if pixels per inch divided by 96.
%group
COM misc / IDWriteBitmapRenderTarget
%prm
this, pixelsPerDip
this : [comobj] IDWriteBitmapRenderTarget インターフェースの COM オブジェクト変数
pixelsPerDip : [float] Type: FLOAT A value that specifies the number of pixels per DIP.
%inst
Sets the number of bitmap pixels per DIP (device-independent pixel).
A DIP is 1/96 inch, so this value is the number if pixels per inch
divided by 96.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteBitmapRenderTarget_GetCurrentTransform
Gets the transform that maps abstract coordinates to DIPs. By default this is the identity transform. Note that this is unrelated to the world transform of the underlying device context.
%group
COM misc / IDWriteBitmapRenderTarget
%prm
this, transform
this : [comobj] IDWriteBitmapRenderTarget インターフェースの COM オブジェクト変数
transform : [var] Type: DWRITE_MATRIX* When this method returns, contains a transform matrix.
%inst
Gets the transform that maps abstract coordinates to DIPs. By default
this is the identity transform. Note that this is unrelated to the
world transform of the underlying device context.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteBitmapRenderTarget_SetCurrentTransform
Sets the transform that maps abstract coordinate to DIPs (device-independent pixel). This does not affect the world transform of the underlying device context.
%group
COM misc / IDWriteBitmapRenderTarget
%prm
this, transform
this : [comobj] IDWriteBitmapRenderTarget インターフェースの COM オブジェクト変数
transform : [var] Type: const DWRITE_MATRIX* Specifies the new transform. This parameter can be NULL, in which case the identity transform is implied.
%inst
Sets the transform that maps abstract coordinate to DIPs
(device-independent pixel). This does not affect the world transform
of the underlying device context.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteBitmapRenderTarget_GetSize
Gets the dimensions of the target bitmap.
%group
COM misc / IDWriteBitmapRenderTarget
%prm
this, size
this : [comobj] IDWriteBitmapRenderTarget インターフェースの COM オブジェクト変数
size : [var] Type: SIZE* Returns  the width and height of the bitmap in pixels.
%inst
Gets the dimensions of the target bitmap.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteBitmapRenderTarget_Resize
Resizes the bitmap.
%group
COM misc / IDWriteBitmapRenderTarget
%prm
this, width, height
this : [comobj] IDWriteBitmapRenderTarget インターフェースの COM オブジェクト変数
width : [int] Type: UINT32 The new bitmap width, in pixels.
height : [int] Type: UINT32 The new bitmap height, in pixels.
%inst
Resizes the bitmap.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFactory_GetSystemFontCollection
Gets an object which represents the set of installed fonts.
%group
COM misc / IDWriteFactory
%prm
this, fontCollection, checkForUpdates
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
fontCollection : [comobj] Type: IDWriteFontCollection** When this method returns, contains the address of a pointer to the system font collection object, or NULL in case of failure.
checkForUpdates : [int] Type: BOOL If this parameter is nonzero, the function performs an immediate check for changes to the set of installed fonts. If this parameter is FALSE, the function will still detect changes if the font cache service is running, but there may be some latency. For example, an application might specify TRUE if it has itself just installed a font and wants to be sure the font collection contains that font.
%inst
Gets an object which represents the set of installed fonts.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFactory_CreateCustomFontCollection
Creates a font collection using a custom font collection loader.
%group
COM misc / IDWriteFactory
%prm
this, collectionLoader, collectionKey, collectionKeySize, fontCollection
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
collectionLoader : [comobj] Type: IDWriteFontCollectionLoader* An application-defined font collection loader, which must have been previously registered using RegisterFontCollectionLoader.
collectionKey : [intptr] Type: const void* The key used by the loader to identify a collection of font files.  The buffer allocated for this key should at least be the size of collectionKeySize.
collectionKeySize : [int] Type: UINT32 The size, in bytes, of the collection key.
fontCollection : [comobj] Type: IDWriteFontCollection** Contains  an address of a pointer to the system font collection object if the method succeeds, or NULL in case of failure.
%inst
Creates a font collection using a custom font collection loader.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFactory_RegisterFontCollectionLoader
Registers a custom font collection loader with the factory object.
%group
COM misc / IDWriteFactory
%prm
this, fontCollectionLoader
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
fontCollectionLoader : [comobj] Type: IDWriteFontCollectionLoader* Pointer to a IDWriteFontCollectionLoader object to be registered.
%inst
Registers a custom font collection loader with the factory object.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This function registers a font collection loader with DirectWrite.
The font collection loader interface, which should be implemented by
a singleton object, handles enumerating font files in a font
collection given a particular type of key. A given instance can only
be registered once. Succeeding attempts will return an error,
indicating that it has already been registered. Note that font file
loader implementations must not register themselves with DirectWrite
inside their constructors, and must not unregister themselves inside
their destructors, because registration and unregistration operations
increment and decrement the object reference count respectively.
Instead, registration and unregistration with DirectWrite of font
file loaders should be performed outside of the font file loader
implementation.


%index
IDWriteFactory_UnregisterFontCollectionLoader
Unregisters a custom font collection loader that was previously registered using RegisterFontCollectionLoader.
%group
COM misc / IDWriteFactory
%prm
this, fontCollectionLoader
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
fontCollectionLoader : [comobj] Type: IDWriteFontCollectionLoader* Pointer to a IDWriteFontCollectionLoader object to be unregistered.
%inst
Unregisters a custom font collection loader that was previously
registered using RegisterFontCollectionLoader.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFactory_CreateFontFileReference
Creates a font file reference object from a local font file.
%group
COM misc / IDWriteFactory
%prm
this, filePath, lastWriteTime, fontFile
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
filePath : [wstr] Type: const WCHAR* An array of characters that contains the absolute file path for the font file. Subsequent operations on the constructed object may fail if the user provided filePath doesn't correspond to a valid file on the disk.
lastWriteTime : [var] Type: const FILETIME* The last modified time of the input file path. If the parameter is omitted, the function will access the font file to obtain its last write time. You should specify this value to avoid extra disk access. Subsequent operations on the constructed object may fail if the user provided lastWriteTime doesn't match the file on the disk.
fontFile : [comobj] Type: IDWriteFontFile** When this method returns, contains an address of a pointer to the newly created font file reference object, or NULL in case of failure.
%inst
Creates a font file reference object from a local font file.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFactory_CreateCustomFontFileReference
Creates a reference to an application-specific font file resource.
%group
COM misc / IDWriteFactory
%prm
this, fontFileReferenceKey, fontFileReferenceKeySize, fontFileLoader, fontFile
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
fontFileReferenceKey : [intptr] Type: const void* A font file reference key that uniquely identifies the font file resource during the lifetime of fontFileLoader.
fontFileReferenceKeySize : [int] Type: UINT32 The size of the font file reference key in bytes.
fontFileLoader : [comobj] Type: IDWriteFontFileLoader* The font file loader that will be used by the font system to load data from the file identified by fontFileReferenceKey.
fontFile : [comobj] Type: IDWriteFontFile** Contains an address of a pointer to the newly created font file object when this method succeeds, or NULL in case of failure.
%inst
Creates a reference to an application-specific font file resource.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This function is provided for cases when an application or a document
needs to use a private font without having to install it on the
system. fontFileReferenceKey has to be unique only in the scope of
the fontFileLoader used in this call.


%index
IDWriteFactory_CreateFontFace
Creates an object that represents a font face.
%group
COM misc / IDWriteFactory
%prm
this, fontFaceType, numberOfFiles, fontFiles, faceIndex, fontFaceSimulationFlags, fontFace
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
fontFaceType : [int] Type: DWRITE_FONT_FACE_TYPE A value that indicates the type of file format of the font face.
numberOfFiles : [int] Type: UINT32 The number of font files, in element count, required to represent the font face.
fontFiles : [comobj] Type: const IDWriteFontFile* A font file object representing the font face.  Because IDWriteFontFace maintains its own references to the input font file objects, you may release them after this call.
faceIndex : [int] Type: UINT32 The zero-based index of a font face, in cases when the font files contain a collection of font faces. If the font files contain a single face, this value should be zero.
fontFaceSimulationFlags : [int] Type: DWRITE_FONT_SIMULATIONS A value that indicates which, if any, font face simulation flags for algorithmic means of making text bold or italic are applied to the current font face.
fontFace : [comobj] Type: IDWriteFontFace** When this method returns, contains an address of a pointer to the newly created font face object, or NULL in case of failure.
%inst
Creates an object that represents a font face.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFactory_CreateRenderingParams
Creates a rendering parameters object with default settings for the primary monitor. Different monitors may have different rendering parameters, for more information see the How to Add Support for Multiple Monitors topic.
%group
COM misc / IDWriteFactory
%prm
this, renderingParams
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
renderingParams : [comobj] Type: IDWriteRenderingParams** When this method returns, contains an address of a pointer to the newly created  rendering parameters object.
%inst
Creates a rendering parameters object with default settings for the
primary monitor. Different monitors may have different rendering
parameters, for more information see the How to Add Support for
Multiple Monitors topic.

[戻り値]
Type: HRESULT Standard HRESULT error code.


%index
IDWriteFactory_CreateMonitorRenderingParams
Creates a rendering parameters object with default settings for the specified monitor. In most cases, this is the preferred way to create a rendering parameters object.
%group
COM misc / IDWriteFactory
%prm
this, monitor, renderingParams
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
monitor : [int] Type: HMONITOR A handle for the specified monitor.
renderingParams : [comobj] Type: IDWriteRenderingParams** When this method returns, contains an address of a pointer to the rendering parameters object created by this method.
%inst
Creates a rendering parameters object with default settings for the
specified monitor. In most cases, this is the preferred way to create
a rendering parameters object.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFactory_CreateCustomRenderingParams
Creates a rendering parameters object with the specified properties. (IDWriteFactory.CreateCustomRenderingParams)
%group
COM misc / IDWriteFactory
%prm
this, gamma, enhancedContrast, clearTypeLevel, pixelGeometry, renderingMode, renderingParams
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
gamma : [float] Type: FLOAT The gamma level to be set for the new rendering parameters object.
enhancedContrast : [float] Type: FLOAT The enhanced contrast level to be set for the new rendering parameters object.
clearTypeLevel : [float] Type: FLOAT The ClearType level to be set for the new rendering parameters object.
pixelGeometry : [int] Type: DWRITE_PIXEL_GEOMETRY Represents the internal structure of a device pixel (that is, the physical arrangement of red, green, and blue color components) that is assumed for purposes of rendering text.
renderingMode : [int] Type: DWRITE_RENDERING_MODE A value that represents the method (for example, ClearType natural quality) for rendering glyphs.
renderingParams : [comobj] Type: IDWriteRenderingParams** When this method returns, contains an address of a pointer to the newly created rendering parameters object.
%inst
Creates a rendering parameters object with the specified properties.
(IDWriteFactory.CreateCustomRenderingParams)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFactory_RegisterFontFileLoader
Registers a font file loader with DirectWrite.
%group
COM misc / IDWriteFactory
%prm
this, fontFileLoader
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
fontFileLoader : [comobj] Type: IDWriteFontFileLoader* Pointer to a IDWriteFontFileLoader object for a particular file resource type.
%inst
Registers a font file loader with DirectWrite.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This function registers a font file loader with DirectWrite. The font
file loader interface, which should be implemented by a singleton
object, handles loading font file resources of a particular type from
a key. A given instance can only be registered once. Succeeding
attempts will return an error, indicating that it has already been
registered. Note that font file loader implementations must not
register themselves with DirectWrite inside their constructors, and
must not unregister themselves inside their destructors, because
registration and unregistration operations increment and decrement
the object reference count respectively. Instead, registration and
unregistration with DirectWrite of font file loaders should be
performed outside of the font file loader implementation.


%index
IDWriteFactory_UnregisterFontFileLoader
Unregisters a font file loader that was previously registered with the DirectWrite font system using RegisterFontFileLoader.
%group
COM misc / IDWriteFactory
%prm
this, fontFileLoader
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
fontFileLoader : [comobj] Type: IDWriteFontFileLoader* Pointer to the file loader that was previously registered with the DirectWrite font system using RegisterFontFileLoader.
%inst
Unregisters a font file loader that was previously registered with
the DirectWrite font system using RegisterFontFileLoader.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This function unregisters font file loader callbacks with the
DirectWrite font system. You should implement the font file loader
interface by a singleton object. Note that font file loader
implementations must not register themselves with DirectWrite inside
their constructors and must not unregister themselves in their
destructors, because registration and unregistration operations
increment and decrement the object reference count respectively.
Instead, registration and unregistration of font file loaders with
DirectWrite should be performed outside of the font file loader
implementation.


%index
IDWriteFactory_CreateTextFormat
Creates a text format object used for text layout. (IDWriteFactory.CreateTextFormat)
%group
COM misc / IDWriteFactory
%prm
this, fontFamilyName, fontCollection, fontWeight, fontStyle, fontStretch, fontSize, localeName, textFormat
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
fontFamilyName : [wstr] Type: const WCHAR* An array of characters that contains the name of the font family
fontCollection : [comobj] Type: IDWriteFontCollection* A pointer to a font collection object. When this is NULL, indicates the system font collection.
fontWeight : [int] Type: DWRITE_FONT_WEIGHT A value that indicates the font weight for the text object created by this method.
fontStyle : [int] Type: DWRITE_FONT_STYLE A value that indicates the font style for the text object created by this method.
fontStretch : [int] Type: DWRITE_FONT_STRETCH A value that indicates the font stretch for the text object created by this method.
fontSize : [float] Type: FLOAT The logical size of the font in DIP ("device-independent pixel") units. A DIP equals 1/96 inch.
localeName : [wstr] Type: const WCHAR* An array of characters that contains the locale name.
textFormat : [comobj] Type: IDWriteTextFormat** When this method returns, contains an address of a pointer to a  newly created text format object, or NULL in case of failure.
%inst
Creates a text format object used for text layout.
(IDWriteFactory.CreateTextFormat)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFactory_CreateTypography
Creates a typography object for use in a text layout.
%group
COM misc / IDWriteFactory
%prm
this, typography
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
typography : [comobj] Type: IDWriteTypography** When this method returns, contains the address of  a pointer to a newly created typography object, or NULL in case of failure.
%inst
Creates a typography object for use in a text layout.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFactory_GetGdiInterop
Creates an object that is used for interoperability with GDI.
%group
COM misc / IDWriteFactory
%prm
this, gdiInterop
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
gdiInterop : [comobj] Type: IDWriteGdiInterop** When this method returns, contains an address of a pointer to a GDI interop object if successful, or NULL in case of failure.
%inst
Creates an object that is used for interoperability with GDI.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFactory_CreateTextLayout
Takes a string, text format, and associated constraints, and produces an object that represents the fully analyzed and formatted result.
%group
COM misc / IDWriteFactory
%prm
this, string, stringLength, textFormat, maxWidth, maxHeight, textLayout
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
string : [int] 
stringLength : [int] Type: UINT32 The number of characters in  the string.
textFormat : [comobj] Type: IDWriteTextFormat* A pointer to an object that indicates the format to apply to the string.
maxWidth : [float] Type: FLOAT The width of the layout box.
maxHeight : [float] Type: FLOAT The height of the layout box.
textLayout : [comobj] Type: IDWriteTextLayout** When this method returns, contains an address of a pointer to the resultant text layout object.
%inst
Takes a string, text format, and associated constraints, and produces
an object that represents the fully analyzed and formatted result.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFactory_CreateGdiCompatibleTextLayout
Takes a string, format, and associated constraints, and produces an object representing the result, formatted for a particular display resolution and measuring mode.
%group
COM misc / IDWriteFactory
%prm
this, string, stringLength, textFormat, layoutWidth, layoutHeight, pixelsPerDip, transform, useGdiNatural, textLayout
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
string : [int] 
stringLength : [int] Type: UINT32 The length of the string, in character count.
textFormat : [comobj] Type: IDWriteTextFormat* The text formatting object to apply to the string.
layoutWidth : [float] Type: FLOAT The width of the layout box.
layoutHeight : [float] Type: FLOAT The height of the layout box.
pixelsPerDip : [float] Type: FLOAT The number of physical pixels per DIP (device independent pixel). For example, if rendering onto a 96 DPI device pixelsPerDip is 1. If rendering onto a 120 DPI device pixelsPerDip is 1.25 (120/96).
transform : [var] Type: const DWRITE_MATRIX* An optional transform applied to the glyphs and their positions. This transform is applied after the scaling specifies the font size and pixels per DIP.
useGdiNatural : [int] Type: BOOL Instructs the text layout to use the same metrics as GDI bi-level text when set to FALSE. When set to TRUE, instructs the text layout to use the same metrics as text measured by GDI using a font created with CLEARTYPE_NATURAL_QUALITY.
textLayout : [comobj] Type: IDWriteTextLayout** When this method returns, contains an address to the pointer of the resultant text layout object.
%inst
Takes a string, format, and associated constraints, and produces an
object representing the result, formatted for a particular display
resolution and measuring mode.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The resulting text layout should only be used for the intended
resolution, and for cases where text scalability is desired
CreateTextLayout should be used instead.


%index
IDWriteFactory_CreateEllipsisTrimmingSign
Creates an inline object for trimming, using an ellipsis as the omission sign.
%group
COM misc / IDWriteFactory
%prm
this, textFormat, trimmingSign
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
textFormat : [comobj] Type: IDWriteTextFormat* A text format object, created with CreateTextFormat, used for text layout.
trimmingSign : [comobj] Type: IDWriteInlineObject** When this method returns, contains an address of a pointer to the omission (that is, ellipsis trimming) sign created by this method.
%inst
Creates an inline object for trimming, using an ellipsis as the
omission sign.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The ellipsis will be created using the current settings of the
format, including base font, style, and any effects. Alternate
omission signs can be created by the application by implementing
IDWriteInlineObject.


%index
IDWriteFactory_CreateTextAnalyzer
Returns an interface for performing text analysis.
%group
COM misc / IDWriteFactory
%prm
this, textAnalyzer
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
textAnalyzer : [comobj] Type: IDWriteTextAnalyzer** When this method returns, contains an address of  a pointer to the newly created text analyzer object.
%inst
Returns an interface for performing text analysis.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFactory_CreateNumberSubstitution
Creates a number substitution object using a locale name, substitution method, and an indicator whether to ignore user overrides (use NLS defaults for the given culture instead).
%group
COM misc / IDWriteFactory
%prm
this, substitutionMethod, localeName, ignoreUserOverride, numberSubstitution
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
substitutionMethod : [int] Type: DWRITE_NUMBER_SUBSTITUTION_METHOD A value that specifies how to apply number substitution on digits and related punctuation.
localeName : [wstr] Type: const WCHAR* The name of the locale to be used in the numberSubstitution object.
ignoreUserOverride : [int] Type: BOOL A Boolean flag that indicates whether to ignore user overrides.
numberSubstitution : [comobj] Type: IDWriteNumberSubstitution** When this method returns, contains an address to  a pointer to the number substitution object created by this method.
%inst
Creates a number substitution object using a locale name,
substitution method, and an indicator whether to ignore user
overrides (use NLS defaults for the given culture instead).

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFactory_CreateGlyphRunAnalysis
Creates a glyph run analysis object, which encapsulates information used to render a glyph run. (IDWriteFactory.CreateGlyphRunAnalysis)
%group
COM misc / IDWriteFactory
%prm
this, glyphRun, pixelsPerDip, transform, renderingMode, measuringMode, baselineOriginX, baselineOriginY, glyphRunAnalysis
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
glyphRun : [int] Type: const DWRITE_GLYPH_RUN* A structure that contains the properties of the glyph run (font face, advances, and so on).
pixelsPerDip : [float] Type: FLOAT Number of physical pixels per DIP (device independent pixel). For example, if rendering onto a 96 DPI bitmap then pixelsPerDip is 1. If rendering onto a 120 DPI bitmap then pixelsPerDip is 1.25.
transform : [var] Type: const DWRITE_MATRIX* Optional transform applied to the glyphs and their positions. This transform is applied after the scaling specified the emSize and pixelsPerDip.
renderingMode : [int] Type: DWRITE_RENDERING_MODE A value that specifies the rendering mode, which must be one of the raster rendering modes (that is, not default and not outline).
measuringMode : [int] Type: DWRITE_MEASURING_MODE Specifies the measuring mode to use with glyphs.
baselineOriginX : [float] Type: FLOAT The horizontal position (X-coordinate) of the baseline origin, in DIPs.
baselineOriginY : [float] Type: FLOAT Vertical position (Y-coordinate) of the baseline origin, in DIPs.
glyphRunAnalysis : [comobj] Type: IDWriteGlyphRunAnalysis** When this method returns, contains an address of a pointer to the newly created glyph run analysis object.
%inst
Creates a glyph run analysis object, which encapsulates information
used to render a glyph run. (IDWriteFactory.CreateGlyphRunAnalysis)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The glyph run analysis object contains the results of analyzing the
glyph run, including the positions of all the glyphs and references
to all of the rasterized glyphs in the font cache.


%index
IDWriteFont_GetFontFamily
Gets the font family to which the specified font belongs.
%group
COM misc / IDWriteFont
%prm
this, fontFamily
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
fontFamily : [comobj] Type: IDWriteFontFamily** When this method returns, contains an address of a pointer to the font family object to which the specified font belongs.
%inst
Gets the font family to which the specified font belongs.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFont_GetWeight
Gets the weight, or stroke thickness, of the specified font.
%group
COM misc / IDWriteFont
%prm
this
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
%inst
Gets the weight, or stroke thickness, of the specified font.

[戻り値]
Type: DWRITE_FONT_WEIGHT A value that indicates the weight for the
specified font.


%index
IDWriteFont_GetStretch
Gets the stretch, or width, of the specified font.
%group
COM misc / IDWriteFont
%prm
this
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
%inst
Gets the stretch, or width, of the specified font.

[戻り値]
Type: DWRITE_FONT_STRETCH A value that indicates the type of stretch,
or width, applied to the specified font.


%index
IDWriteFont_GetStyle
Gets the style, or slope, of the specified font.
%group
COM misc / IDWriteFont
%prm
this
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
%inst
Gets the style, or slope, of the specified font.

[戻り値]
Type: DWRITE_FONT_STYLE A value that indicates the type of style, or
slope, of the specified font.


%index
IDWriteFont_IsSymbolFont
Determines whether the font is a symbol font. (IDWriteFont.IsSymbolFont)
%group
COM misc / IDWriteFont
%prm
this
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
%inst
Determines whether the font is a symbol font.
(IDWriteFont.IsSymbolFont)

[戻り値]
Type: BOOL TRUE if the font is a symbol font; otherwise, FALSE.


%index
IDWriteFont_GetFaceNames
Gets a localized strings collection containing the face names for the font (such as Regular or Bold), indexed by locale name.
%group
COM misc / IDWriteFont
%prm
this, names
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
names : [comobj] Type: IDWriteLocalizedStrings** When this method returns, contains an address to a  pointer to the newly created localized strings object.
%inst
Gets a localized strings collection containing the face names for the
font (such as Regular or Bold), indexed by locale name.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFont_GetInformationalStrings
Gets a localized strings collection containing the specified informational strings, indexed by locale name.
%group
COM misc / IDWriteFont
%prm
this, informationalStringID, informationalStrings, exists
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
informationalStringID : [int] Type: DWRITE_INFORMATIONAL_STRING_ID A value that identifies the  informational string to get. For example, DWRITE_INFORMATIONAL_STRING_DESCRIPTION specifies a string that contains a description of the font.
informationalStrings : [comobj] Type: IDWriteLocalizedStrings** When this method returns, contains an address of a pointer to the newly created localized strings object.
exists : [var] Type: BOOL* When this method returns, TRUE if the font contains the specified string ID; otherwise, FALSE.
%inst
Gets a localized strings collection containing the specified
informational strings, indexed by locale name.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
If the font does not contain the string specified by
informationalStringID, the return value is S_OK but
informationalStrings receives a NULL pointer and exists receives the
value FALSE.


%index
IDWriteFont_GetSimulations
Gets a value that indicates what simulations are applied to the specified font.
%group
COM misc / IDWriteFont
%prm
this
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
%inst
Gets a value that indicates what simulations are applied to the
specified font.

[戻り値]
Type: DWRITE_FONT_SIMULATIONS A value that indicates one or more of
the types of simulations (none, bold, or oblique) applied to the
specified font.


%index
IDWriteFont_GetMetrics
Obtains design units and common metrics for the font face. These metrics are applicable to all the glyphs within a font face and are used by applications for layout calculations. (IDWriteFont.GetMetrics)
%group
COM misc / IDWriteFont
%prm
this, fontMetrics
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
fontMetrics : [var] Type: DWRITE_FONT_METRICS* When this method returns, contains a structure that has font metrics for the current font face. The metrics returned by this function are in font design units.
%inst
Obtains design units and common metrics for the font face. These
metrics are applicable to all the glyphs within a font face and are
used by applications for layout calculations.
(IDWriteFont.GetMetrics)


%index
IDWriteFont_HasCharacter
Determines whether the font supports a specified character.
%group
COM misc / IDWriteFont
%prm
this, unicodeValue, exists
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
unicodeValue : [int] Type: UINT32 A Unicode (UCS-4) character value for the method to inspect.
exists : [var] Type: BOOL* When this method returns, TRUE if the font supports the specified character; otherwise, FALSE.
%inst
Determines whether the font supports a specified character.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFont_CreateFontFace
Creates a font face object for the font. (IDWriteFont.CreateFontFace)
%group
COM misc / IDWriteFont
%prm
this, fontFace
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
fontFace : [comobj] Type: IDWriteFontFace** When this method returns, contains an address of a pointer to the newly created font face object.
%inst
Creates a font face object for the font. (IDWriteFont.CreateFontFace)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFontCollection_GetFontFamilyCount
Gets the number of font families in the collection.
%group
COM misc / IDWriteFontCollection
%prm
this
this : [comobj] IDWriteFontCollection インターフェースの COM オブジェクト変数
%inst
Gets the number of font families in the collection.

[戻り値]
Type: UINT32 The number of font families in the collection.


%index
IDWriteFontCollection_GetFontFamily
Creates a font family object given a zero-based font family index.
%group
COM misc / IDWriteFontCollection
%prm
this, index, fontFamily
this : [comobj] IDWriteFontCollection インターフェースの COM オブジェクト変数
index : [int] Type: UINT32 Zero-based index of the font family.
fontFamily : [comobj] Type: IDWriteFontFamily** When this method returns, contains the address of   a pointer to the newly created font family object.
%inst
Creates a font family object given a zero-based font family index.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFontCollection_FindFamilyName
Finds the font family with the specified family name.
%group
COM misc / IDWriteFontCollection
%prm
this, familyName, index, exists
this : [comobj] IDWriteFontCollection インターフェースの COM オブジェクト変数
familyName : [wstr] Type: const WCHAR* An array of characters, which is null-terminated, containing the name of the font family. The name is not case-sensitive but must otherwise exactly match a family name in the collection.
index : [int] Type: UINT32* When this method returns, contains the zero-based index of the matching font family if the family name was found; otherwise, UINT_MAX.
exists : [var] Type: BOOL* When this method returns, TRUE if the family name exists; otherwise, FALSE.
%inst
Finds the font family with the specified family name.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFontCollection_GetFontFromFontFace
Gets the font object that corresponds to the same physical font as the specified font face object. The specified physical font must belong to the font collection.
%group
COM misc / IDWriteFontCollection
%prm
this, fontFace, font
this : [comobj] IDWriteFontCollection インターフェースの COM オブジェクト変数
fontFace : [comobj] Type: IDWriteFontFace* A font face object that specifies the physical font.
font : [comobj] Type: IDWriteFont** When this method returns, contains the address of a pointer to the newly created font object if successful; otherwise, NULL.
%inst
Gets the font object that corresponds to the same physical font as
the specified font face object. The specified physical font must
belong to the font collection.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFontCollectionLoader_CreateEnumeratorFromKey
Creates a font file enumerator object that encapsulates a collection of font files. The font system calls back to this interface to create a font collection.
%group
COM misc / IDWriteFontCollectionLoader
%prm
this, factory, collectionKey, collectionKeySize, fontFileEnumerator
this : [comobj] IDWriteFontCollectionLoader インターフェースの COM オブジェクト変数
factory : [comobj] Type: IDWriteFactory* Pointer to the IDWriteFactory object that was used to create the current font collection.
collectionKey : [intptr] Type: const void* A font collection key that uniquely identifies the collection of font files within the scope of the font collection loader being used. The buffer allocated for this key must be at least  the size, in bytes, specified by collectionKeySize.
collectionKeySize : [int] Type: UINT32 The size of the font collection key, in bytes.
fontFileEnumerator : [comobj] Type: IDWriteFontFileEnumerator** When this method returns, contains the address of  a pointer to the newly created font file enumerator.
%inst
Creates a font file enumerator object that encapsulates a collection
of font files. The font system calls back to this interface to create
a font collection.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFontFace_GetType
Obtains the file format type of a font face.
%group
COM misc / IDWriteFontFace
%prm
this
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
%inst
Obtains the file format type of a font face.

[戻り値]
Type: DWRITE_FONT_FACE_TYPE A value that indicates the type of format
for the font face (such as Type 1, TrueType, vector, or bitmap).


%index
IDWriteFontFace_GetFiles
Obtains the font files representing a font face.
%group
COM misc / IDWriteFontFace
%prm
this, numberOfFiles, fontFiles
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
numberOfFiles : [int] Type: UINT32* If fontFiles is NULL, receives the number of files representing the font face.  Otherwise, the number of font files being requested should be passed.  See the Remarks section below for more information.
fontFiles : [comobj] Type: IDWriteFontFile** When this method returns, contains a pointer to a user-provided array that stores pointers to font files representing the font face. This parameter can be NULL if the user wants only the number of files representing the font face. This API increments reference count of the font file pointers returned according to COM conventions, and the client should release them when finished.
%inst
Obtains the font files representing a font face.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The IDWriteFontFace::GetFiles method should be called twice. The
first time you call GetFilesfontFiles should be NULL. When the method
returns, numberOfFiles receives the number of font files that
represent the font face. Then, call the method a second time, passing
the numberOfFiles value that was output the first call, and a
non-null buffer of the correct size to store the IDWriteFontFile
pointers.


%index
IDWriteFontFace_GetIndex
Obtains the index of a font face in the context of its font files.
%group
COM misc / IDWriteFontFace
%prm
this
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
%inst
Obtains the index of a font face in the context of its font files.

[戻り値]
Type: UINT32 The zero-based index of a font face in cases when the
font files contain a collection of font faces. If the font files
contain a single face, this value is zero.


%index
IDWriteFontFace_GetSimulations
Obtains the algorithmic style simulation flags of a font face. (IDWriteFontFace.GetSimulations)
%group
COM misc / IDWriteFontFace
%prm
this
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
%inst
Obtains the algorithmic style simulation flags of a font face.
(IDWriteFontFace.GetSimulations)

[戻り値]
Type: DWRITE_FONT_SIMULATIONS Font face simulation flags for
algorithmic means of making text bold or italic.


%index
IDWriteFontFace_IsSymbolFont
Determines whether the font is a symbol font. (IDWriteFontFace.IsSymbolFont)
%group
COM misc / IDWriteFontFace
%prm
this
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
%inst
Determines whether the font is a symbol font.
(IDWriteFontFace.IsSymbolFont)

[戻り値]
Type: BOOL Returns TRUE if the font is a symbol font, otherwise
FALSE.


%index
IDWriteFontFace_GetMetrics
Obtains design units and common metrics for the font face. These metrics are applicable to all the glyphs within a font face and are used by applications for layout calculations. (IDWriteFontFace.GetMetrics)
%group
COM misc / IDWriteFontFace
%prm
this, fontFaceMetrics
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
fontFaceMetrics : [var] Type: DWRITE_FONT_METRICS* When this method returns, a?DWRITE_FONT_METRICS structure that holds metrics (such as ascent, descent, or cap height) for the current font face element. The metrics returned by this function are in font design units.
%inst
Obtains design units and common metrics for the font face. These
metrics are applicable to all the glyphs within a font face and are
used by applications for layout calculations.
(IDWriteFontFace.GetMetrics)


%index
IDWriteFontFace_GetGlyphCount
Obtains the number of glyphs in the font face.
%group
COM misc / IDWriteFontFace
%prm
this
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
%inst
Obtains the number of glyphs in the font face.

[戻り値]
Type: UINT16 The number of glyphs in the font face.


%index
IDWriteFontFace_GetDesignGlyphMetrics
Obtains ideal (resolution-independent) glyph metrics in font design units.
%group
COM misc / IDWriteFontFace
%prm
this, glyphIndices, glyphCount, glyphMetrics, isSideways
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
glyphIndices : [int] Type: const UINT16* An array of glyph indices for which to compute  metrics. The array must contain at least as many elements as specified by glyphCount.
glyphCount : [int] Type: UINT32 The number of elements in the glyphIndices array.
glyphMetrics : [var] Type: DWRITE_GLYPH_METRICS* When this method returns, contains an array of DWRITE_GLYPH_METRICS structures.  glyphMetrics must be initialized with an empty buffer that contains at least as many elements as glyphCount. The metrics returned by this function are in font design units.
isSideways : [int] Type: BOOL Indicates whether the font is being used in a sideways run. This can affect the glyph metrics if the font has oblique simulation because sideways oblique simulation differs from non-sideways oblique simulation
%inst
Obtains ideal (resolution-independent) glyph metrics in font design
units.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Design glyph metrics are used for glyph positioning.


%index
IDWriteFontFace_GetGlyphIndices
Returns the nominal mapping of UCS4 Unicode code points to glyph indices as defined by the font 'CMAP' table.
%group
COM misc / IDWriteFontFace
%prm
this, codePoints, codePointCount, glyphIndices
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
codePoints : [int] Type: const UINT32* An array of USC4 code points from which to obtain nominal glyph indices. The array must be allocated and be able to contain the number of elements specified by codePointCount.
codePointCount : [int] Type: UINT32 The number of elements in the codePoints array.
glyphIndices : [int] Type: UINT16* When this method returns, contains a pointer to an array of nominal glyph indices filled by this function.
%inst
Returns the nominal mapping of UCS4 Unicode code points to glyph
indices as defined by the font 'CMAP' table.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Note that this mapping is primarily provided for line layout engines
built on top of the physical font API. Because of OpenType glyph
substitution and line layout character substitution, the nominal
conversion does not always correspond to how a Unicode string will
map to glyph indices when rendering using a particular font face.
Also, note that Unicode variant selectors provide for alternate
mappings for character to glyph. This call will always return the
default variant. When characters are not present in the font this
method returns the index 0, which is the undefined glyph or ".notdef"
glyph. If a character isn't in a font, IDWriteFont::HasCharacter
returns false and GetUnicodeRanges doesn't return it in the range.


%index
IDWriteFontFace_TryGetFontTable
Finds the specified OpenType font table if it exists and returns a pointer to it. The function accesses the underlying font data through the IDWriteFontFileStream interface implemented by the font file loader.
%group
COM misc / IDWriteFontFace
%prm
this, openTypeTableTag, tableData, tableSize, tableContext, exists
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
openTypeTableTag : [int] Type: UINT32 The four-character tag of a OpenType font table to find. Use the DWRITE_MAKE_OPENTYPE_TAG macro to create it as an UINT32. Unlike GDI, it does not support the special TTCF and null tags to access the whole font.
tableData : [var] Type: const void** When this method returns, contains the address of  a pointer to the base of the table in memory. The pointer is valid only as long as the font face used to get the font table still exists; (not any other font face, even if it actually refers to the same physical font). This parameter is passed uninitialized.
tableSize : [int] Type: UINT32* When this method returns, contains a pointer to the size, in bytes, of the font table.
tableContext : [var] Type: void** When this method returns, the address of a pointer to  the opaque context, which must be freed by calling ReleaseFontTable. The context actually comes from the lower-level IDWriteFontFileStream, which may be implemented by the application or DWrite itself. It is possible for a NULL tableContext to be returned, especially if the implementation performs direct memory mapping on the whole file. Nevertheless, always release it later, and do not use it as a test for function success. The same table can be queried multiple times, but because each returned context can be different, you must release each context separately.
exists : [var] Type: BOOL* When this method returns, TRUE if the font table exists; otherwise, FALSE.
%inst
Finds the specified OpenType font table if it exists and returns a
pointer to it. The function accesses the underlying font data through
the IDWriteFontFileStream interface implemented by the font file
loader.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The context for the same tag may be different for each call, so each
one must be held and released separately.


%index
IDWriteFontFace_ReleaseFontTable
Releases the table obtained earlier from TryGetFontTable.
%group
COM misc / IDWriteFontFace
%prm
this, tableContext
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
tableContext : [intptr] Type: void* A pointer to the opaque context from TryGetFontTable.
%inst
Releases the table obtained earlier from TryGetFontTable.


%index
IDWriteFontFace_GetGlyphRunOutline
Computes the outline of a run of glyphs by calling back to the outline sink interface.
%group
COM misc / IDWriteFontFace
%prm
this, emSize, glyphIndices, glyphAdvances, glyphOffsets, glyphCount, isSideways, isRightToLeft, geometrySink
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
emSize : [float] Type: FLOAT The logical size of the font in DIP units. A DIP ("device-independent pixel") equals 1/96 inch.
glyphIndices : [int] Type: const UINT16* An array of glyph indices. The glyphs are in logical order and the advance direction depends on the isRightToLeft parameter. The array must be allocated and be able to contain the number of elements specified by glyphCount.
glyphAdvances : [var] Type: const FLOAT* An optional array of glyph advances in DIPs. The advance of a glyph is the amount to advance the position (in the direction of the baseline) after drawing the glyph. glyphAdvances contains the number of elements specified by glyphCount.
glyphOffsets : [var] Type: const DWRITE_GLYPH_OFFSET* An optional array of glyph offsets, each of which specifies the offset along the baseline and offset perpendicular to the baseline of a glyph relative to the current pen position.   glyphOffsets contains the number of elements specified by glyphCount.
glyphCount : [int] Type: UINT32 The number of glyphs in the run.
isSideways : [int] Type: BOOL If TRUE, the ascender of the glyph runs alongside the baseline. If FALSE, the glyph ascender runs perpendicular to the baseline. For example, an English alphabet on a vertical baseline would have isSideways set to FALSE. A client can render a vertical run by setting isSideways to TRUE and rotating the resulting geometry 90 degrees to the right using a transform. The isSideways and isRightToLeft parameters cannot both be true.
isRightToLeft : [int] Type: BOOL The visual order of the glyphs. If this parameter is FALSE, then glyph advances are from left to right. If TRUE, the advance direction is right to left. By default, the advance direction is left to right.
geometrySink : [comobj] Type: IDWriteGeometrySink* A pointer to the interface that is called back to perform outline drawing operations.
%inst
Computes the outline of a run of glyphs by calling back to the
outline sink interface.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFontFace_GetRecommendedRenderingMode
Determines the recommended rendering mode for the font, using the specified size and rendering parameters. (IDWriteFontFace.GetRecommendedRenderingMode)
%group
COM misc / IDWriteFontFace
%prm
this, emSize, pixelsPerDip, measuringMode, renderingParams, renderingMode
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
emSize : [float] Type: FLOAT The logical size of the font in DIP units. A DIP ("device-independent pixel") equals 1/96 inch.
pixelsPerDip : [float] Type: FLOAT The number of physical pixels per DIP. For example, if the DPI of the rendering surface is 96, this value is 1.0f. If the DPI is 120, this value is 120.0f/96.
measuringMode : [int] Type: DWRITE_MEASURING_MODE The measuring method that will be used for glyphs in the font. Renderer implementations may choose different rendering modes for different measuring methods, for example:
renderingParams : [comobj] Type: IDWriteRenderingParams* A pointer to an object that contains rendering settings such as gamma level, enhanced contrast, and ClearType level. This parameter is necessary in case the rendering parameters object overrides the rendering mode.
renderingMode : [var] Type: DWRITE_RENDERING_MODE* When this method returns, contains a value that indicates the recommended rendering mode to use.
%inst
Determines the recommended rendering mode for the font, using the
specified size and rendering parameters.
(IDWriteFontFace.GetRecommendedRenderingMode)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFontFace_GetGdiCompatibleMetrics
Obtains design units and common metrics for the font face. These metrics are applicable to all the glyphs within a fontface and are used by applications for layout calculations.
%group
COM misc / IDWriteFontFace
%prm
this, emSize, pixelsPerDip, transform, fontFaceMetrics
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
emSize : [float] Type: **FLOAT** The logical size of the font in DIP units.
pixelsPerDip : [float] Type: **FLOAT** The number of physical pixels per DIP.
transform : [var] Type: **const [**DWRITE\_MATRIX**](/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix)\*** An optional transform applied to the glyphs and their positions. This transform is applied after the scaling specified by the font size and *pixelsPerDip*.
fontFaceMetrics : [var] Type: **[**DWRITE\_FONT\_METRICS**](/windows/win32/api/dwrite/ns-dwrite-dwrite_font_metrics)\*** A pointer to a [**DWRITE\_FONT\_METRIC**](/windows/win32/api/dwrite/ns-dwrite-dwrite_font_metrics)S structure to fill in. The metrics returned by this function are in font design units.
%inst
Obtains design units and common metrics for the font face. These
metrics are applicable to all the glyphs within a fontface and are
used by applications for layout calculations.

[戻り値]
Type: **HRESULT** Standard HRESULT error code.


%index
IDWriteFontFace_GetGdiCompatibleGlyphMetrics
Obtains glyph metrics in font design units with the return values compatible with what GDI would produce.
%group
COM misc / IDWriteFontFace
%prm
this, emSize, pixelsPerDip, transform, useGdiNatural, glyphIndices, glyphCount, glyphMetrics, isSideways
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
emSize : [float] Type: **FLOAT** The ogical size of the font in DIP units.
pixelsPerDip : [float] Type: **FLOAT** The number of physical pixels per DIP.
transform : [var] Type: **const [**DWRITE\_MATRIX**](/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix)\*** An optional transform applied to the glyphs and their positions. This transform is applied after the scaling specified by the font size and *pixelsPerDip*.
useGdiNatural : [int] Type: **BOOL** When set to **FALSE**, the metrics are the same as the metrics of GDI aliased text. When set to **TRUE**, the metrics are the same as the metrics of text measured by GDI using a font created with **CLEARTYPE\_NATURAL\_QUALITY**.
glyphIndices : [int] Type: **const UINT16\*** An array of glyph indices for which to compute the metrics.
glyphCount : [int] Type: **UINT32** The number of elements in the *glyphIndices* array.
glyphMetrics : [var] Type: **[**DWRITE\_GLYPH\_METRICS**](/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_metrics)\*** An array of [**DWRITE\_GLYPH\_METRICS**](/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_metrics) structures filled by this function. The metrics are in font design units.
isSideways : [int] Type: **BOOL** A BOOL value that indicates whether the font is being used in a sideways run. This can affect the glyph metrics if the font has oblique simulation because sideways oblique simulation differs from non-sideways oblique simulation.
%inst
Obtains glyph metrics in font design units with the return values
compatible with what GDI would produce.

[戻り値]
Type: **HRESULT** Standard **HRESULT** error code. If any of the
input glyph indices are outside of the valid glyph index range for
the current font face, **E\_INVALIDARG** will be returned.


%index
IDWriteFontFamily_GetFontCollection
IDWriteFontFamily::GetFontCollection (vtable slot 3)
%group
COM misc / IDWriteFontFamily
%prm
this, fontCollection
this : [comobj] IDWriteFontFamily インターフェースの COM オブジェクト変数
fontCollection : [comobj] 
%inst


%index
IDWriteFontFamily_GetFontCount
IDWriteFontFamily::GetFontCount (vtable slot 4)
%group
COM misc / IDWriteFontFamily
%prm
this
this : [comobj] IDWriteFontFamily インターフェースの COM オブジェクト変数
%inst


%index
IDWriteFontFamily_GetFont
IDWriteFontFamily::GetFont (vtable slot 5)
%group
COM misc / IDWriteFontFamily
%prm
this, index, font
this : [comobj] IDWriteFontFamily インターフェースの COM オブジェクト変数
index : [int] 
font : [comobj] 
%inst


%index
IDWriteFontFamily_GetFamilyNames
Creates a localized strings object that contains the family names for the font family, indexed by locale name. (IDWriteFontFamily.GetFamilyNames)
%group
COM misc / IDWriteFontFamily
%prm
this, names
this : [comobj] IDWriteFontFamily インターフェースの COM オブジェクト変数
names : [comobj] Type: IDWriteLocalizedStrings** The address of a pointer to the newly created IDWriteLocalizedStrings object.
%inst
Creates a localized strings object that contains the family names for
the font family, indexed by locale name.
(IDWriteFontFamily.GetFamilyNames)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The following code example shows how to get the font family name from
a IDWriteFontFamily object.
This doc was truncated.


%index
IDWriteFontFamily_GetFirstMatchingFont
Gets the font that best matches the specified properties.
%group
COM misc / IDWriteFontFamily
%prm
this, weight, stretch, style, matchingFont
this : [comobj] IDWriteFontFamily インターフェースの COM オブジェクト変数
weight : [int] Type: DWRITE_FONT_WEIGHT A value that is used to match a requested font weight.
stretch : [int] Type: DWRITE_FONT_STRETCH A value that is used to match a requested font stretch.
style : [int] Type: DWRITE_FONT_STYLE A value that is used to match a requested font style.
matchingFont : [comobj] Type: IDWriteFont** When this method returns, contains the address of a pointer to the newly created IDWriteFont object.
%inst
Gets the font that best matches the specified properties.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFontFamily_GetMatchingFonts
Gets a list of fonts in the font family ranked in order of how well they match the specified properties.
%group
COM misc / IDWriteFontFamily
%prm
this, weight, stretch, style, matchingFonts
this : [comobj] IDWriteFontFamily インターフェースの COM オブジェクト変数
weight : [int] Type: DWRITE_FONT_WEIGHT A value that is used to match a requested font weight.
stretch : [int] Type: DWRITE_FONT_STRETCH A value that is used to match a requested font stretch.
style : [int] Type: DWRITE_FONT_STYLE A value that is used to match a requested font style.
matchingFonts : [comobj] Type: IDWriteFontList** An address of a pointer to the newly created IDWriteFontList object.
%inst
Gets a list of fonts in the font family ranked in order of how well
they match the specified properties.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFontFile_GetReferenceKey
Obtains the pointer to the reference key of a font file. The returned pointer is valid until the font file object is released.
%group
COM misc / IDWriteFontFile
%prm
this, fontFileReferenceKey, fontFileReferenceKeySize
this : [comobj] IDWriteFontFile インターフェースの COM オブジェクト変数
fontFileReferenceKey : [var] Type: const void** When this method returns, contains an address of  a pointer to the font file reference key. Note that the pointer value is only valid until the font file object it is obtained from is released. This parameter is passed uninitialized.
fontFileReferenceKeySize : [int] Type: UINT32* When this method returns, contains the size of the font file reference key in bytes. This parameter is passed uninitialized.
%inst
Obtains the pointer to the reference key of a font file. The returned
pointer is valid until the font file object is released.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFontFile_GetLoader
Obtains the file loader associated with a font file object.
%group
COM misc / IDWriteFontFile
%prm
this, fontFileLoader
this : [comobj] IDWriteFontFile インターフェースの COM オブジェクト変数
fontFileLoader : [comobj] Type: IDWriteFontFileLoader** When this method returns, contains the address of  a pointer to the font file loader associated with the font file object.
%inst
Obtains the file loader associated with a font file object.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFontFile_Analyze
Analyzes a file and returns whether it represents a font, and whether the font type is supported by the font system.
%group
COM misc / IDWriteFontFile
%prm
this, isSupportedFontType, fontFileType, fontFaceType, numberOfFaces
this : [comobj] IDWriteFontFile インターフェースの COM オブジェクト変数
isSupportedFontType : [var] Type: BOOL* TRUE if the font type is supported by the font system; otherwise, FALSE.
fontFileType : [var] Type: DWRITE_FONT_FILE_TYPE* When this method returns, contains a value that indicates the type of the font file. Note that even if  isSupportedFontType is FALSE, the fontFileType value may be different from DWRITE_FONT_FILE_TYPE_UNKNOWN.
fontFaceType : [var] Type: DWRITE_FONT_FACE_TYPE* When this method returns, contains a value that indicates the type of the font face. If fontFileType is not equal to DWRITE_FONT_FILE_TYPE_UNKNOWN, then that can be constructed from the font file.
numberOfFaces : [int] Type: UINT32* When this method returns, contains the number of font faces contained in the font file.
%inst
Analyzes a file and returns whether it represents a font, and whether
the font type is supported by the font system.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Important Certain font file types are recognized, but not supported
by the font system. For example, the font system will recognize a
file as a Type 1 font file but will not be able to construct a font
face object from it. In such situations, Analyze will set
isSupportedFontType output parameter to FALSE.


%index
IDWriteFontFileEnumerator_MoveNext
Advances to the next font file in the collection. When it is first created, the enumerator is positioned before the first element of the collection and the first call to MoveNext advances to the first file.
%group
COM misc / IDWriteFontFileEnumerator
%prm
this, hasCurrentFile
this : [comobj] IDWriteFontFileEnumerator インターフェースの COM オブジェクト変数
hasCurrentFile : [var] Type: BOOL* When the method returns, contains  the value TRUE if the enumerator advances to a file; otherwise, FALSE if the enumerator advances past the last file in the collection.
%inst
Advances to the next font file in the collection. When it is first
created, the enumerator is positioned before the first element of the
collection and the first call to MoveNext advances to the first file.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFontFileEnumerator_GetCurrentFontFile
Gets a reference to the current font file.
%group
COM misc / IDWriteFontFileEnumerator
%prm
this, fontFile
this : [comobj] IDWriteFontFileEnumerator インターフェースの COM オブジェクト変数
fontFile : [comobj] Type: IDWriteFontFile** When this method returns, the address of a pointer to the newly created IDWriteFontFile  object.
%inst
Gets a reference to the current font file.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFontFileLoader_CreateStreamFromKey
Creates a font file stream object that encapsulates an open file resource.
%group
COM misc / IDWriteFontFileLoader
%prm
this, fontFileReferenceKey, fontFileReferenceKeySize, fontFileStream
this : [comobj] IDWriteFontFileLoader インターフェースの COM オブジェクト変数
fontFileReferenceKey : [intptr] Type: const void* A pointer to a font file reference key that uniquely identifies the font file resource within the scope of the font loader being used. The buffer allocated for this key must at least be the size, in bytes, specified by  fontFileReferenceKeySize.
fontFileReferenceKeySize : [int] Type: UINT32 The size of font file reference key, in bytes.
fontFileStream : [comobj] Type: IDWriteFontFileStream** When this method returns, contains the address of a pointer to the newly created IDWriteFontFileStream object.
%inst
Creates a font file stream object that encapsulates an open file
resource.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The resource is closed when the last reference to fontFileStream is
released.


%index
IDWriteFontFileStream_ReadFileFragment
Reads a fragment from a font file.
%group
COM misc / IDWriteFontFileStream
%prm
this, fragmentStart, fileOffset, fragmentSize, fragmentContext
this : [comobj] IDWriteFontFileStream インターフェースの COM オブジェクト変数
fragmentStart : [var] Type: const void** When this method returns, contains an address of a  pointer to the start of the font file fragment.  This parameter is passed uninitialized.
fileOffset : [int64] Type: UINT64 The offset of the fragment, in bytes, from the beginning of the font file.
fragmentSize : [int64] Type: UINT64 The size of the file fragment, in bytes.
fragmentContext : [var] Type: void** When this method returns, contains the address of a pointer to a pointer to the client-defined context to be passed to ReleaseFileFragment.
%inst
Reads a fragment from a font file.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Note that ReadFileFragment implementations must check whether the
requested font file fragment is within the file bounds. Otherwise, an
error should be returned from ReadFileFragment.
DirectWrite may invoke IDWriteFontFileStream methods on the same
object from multiple threads simultaneously. Therefore,
ReadFileFragment implementations that rely on internal mutable state
must serialize access to such state across multiple threads. For
example, an implementation that uses separate Seek and Read
operations to read a file fragment must place the code block
containing Seek and Read calls under a lock or a critical section.


%index
IDWriteFontFileStream_ReleaseFileFragment
Releases a fragment from a file.
%group
COM misc / IDWriteFontFileStream
%prm
this, fragmentContext
this : [comobj] IDWriteFontFileStream インターフェースの COM オブジェクト変数
fragmentContext : [intptr] Type: void* A pointer to the client-defined context of a font fragment returned from ReadFileFragment.
%inst
Releases a fragment from a file.


%index
IDWriteFontFileStream_GetFileSize
Obtains the total size of a file.
%group
COM misc / IDWriteFontFileStream
%prm
this, fileSize
this : [comobj] IDWriteFontFileStream インターフェースの COM オブジェクト変数
fileSize : [int64] Type: UINT64* When this method returns, contains the total size of the file.
%inst
Obtains the total size of a file.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Implementing GetFileSize() for asynchronously loaded font files may
require downloading the complete file contents. Therefore, this
method should be used only for operations that either require a
complete font file to be loaded (for example, copying a font file) or
that need to make decisions based on the value of the file size (for
example, validation against a persisted file size).


%index
IDWriteFontFileStream_GetLastWriteTime
Obtains the last modified time of the file.
%group
COM misc / IDWriteFontFileStream
%prm
this, lastWriteTime
this : [comobj] IDWriteFontFileStream インターフェースの COM オブジェクト変数
lastWriteTime : [int64] Type: UINT64* When this method returns, contains  the last modified time of the file in the format that represents the number of 100-nanosecond intervals since January 1, 1601 (UTC).
%inst
Obtains the last modified time of the file.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The "last modified time" is used by DirectWrite font selection
algorithms to determine whether one font resource is more up to date
than another one.


%index
IDWriteFontList_GetFontCollection
Gets the font collection that contains the fonts in the font list.
%group
COM misc / IDWriteFontList
%prm
this, fontCollection
this : [comobj] IDWriteFontList インターフェースの COM オブジェクト変数
fontCollection : [comobj] Type: IDWriteFontCollection** When this method returns, contains the address of a pointer to the current IDWriteFontCollection object.
%inst
Gets the font collection that contains the fonts in the font list.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteFontList_GetFontCount
Gets the number of fonts in the font list.
%group
COM misc / IDWriteFontList
%prm
this
this : [comobj] IDWriteFontList インターフェースの COM オブジェクト変数
%inst
Gets the number of fonts in the font list.

[戻り値]
Type: UINT32 The number of fonts in the font list.


%index
IDWriteFontList_GetFont
Gets a font given its zero-based index. (IDWriteFontList.GetFont)
%group
COM misc / IDWriteFontList
%prm
this, index, font
this : [comobj] IDWriteFontList インターフェースの COM オブジェクト変数
index : [int] Type: UINT32 Zero-based index of the font in the font list.
font : [comobj] Type: IDWriteFont** When this method returns, contains the address of a pointer to the newly created IDWriteFont object.
%inst
Gets a font given its zero-based index. (IDWriteFontList.GetFont)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteGdiInterop_CreateFontFromLOGFONT
Creates a font object that matches the properties specified by the LOGFONT structure. (IDWriteGdiInterop.CreateFontFromLOGFONT)
%group
COM misc / IDWriteGdiInterop
%prm
this, logFont, font
this : [comobj] IDWriteGdiInterop インターフェースの COM オブジェクト変数
logFont : [var] Type: const LOGFONTW* A structure containing a GDI-compatible font description.
font : [comobj] Type: IDWriteFont** When this method returns, contains an address of a  pointer to a newly created IDWriteFont  object if successful; otherwise, NULL.
%inst
Creates a font object that matches the properties specified by the
LOGFONT structure. (IDWriteGdiInterop.CreateFontFromLOGFONT)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteGdiInterop_ConvertFontToLOGFONT
Initializes a LOGFONT structure based on the GDI-compatible properties of the specified font. (IDWriteGdiInterop.ConvertFontToLOGFONT)
%group
COM misc / IDWriteGdiInterop
%prm
this, font, logFont, isSystemFont
this : [comobj] IDWriteGdiInterop インターフェースの COM オブジェクト変数
font : [comobj] Type: IDWriteFont* An IDWriteFont object to be converted into a GDI-compatible LOGFONT structure.
logFont : [var] Type: LOGFONTW* When this method returns, contains a structure that receives a GDI-compatible font description.
isSystemFont : [var] Type: BOOL* When this method returns, contains TRUE if the specified font object is part of the system font collection; otherwise, FALSE.
%inst
Initializes a LOGFONT structure based on the GDI-compatible
properties of the specified font.
(IDWriteGdiInterop.ConvertFontToLOGFONT)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The conversion to a LOGFONT by using ConvertFontToLOGFONT operates at
the logical font level and does not guarantee that it will map to a
specific physical font. It is not guaranteed that GDI will select the
same physical font for displaying text formatted by a LOGFONT as the
IDWriteFont object that was converted.


%index
IDWriteGdiInterop_ConvertFontFaceToLOGFONT
Initializes a LOGFONT structure based on the GDI-compatible properties of the specified font. (IDWriteGdiInterop.ConvertFontFaceToLOGFONT)
%group
COM misc / IDWriteGdiInterop
%prm
this, font, logFont
this : [comobj] IDWriteGdiInterop インターフェースの COM オブジェクト変数
font : [comobj] Type: IDWriteFontFace* An IDWriteFontFace object to be converted into a GDI-compatible LOGFONT structure.
logFont : [var] Type: LOGFONTW* When this method returns, contains a pointer to a structure that receives a GDI-compatible font description.
%inst
Initializes a LOGFONT structure based on the GDI-compatible
properties of the specified font.
(IDWriteGdiInterop.ConvertFontFaceToLOGFONT)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The conversion to a LOGFONT by using ConvertFontFaceToLOGFONT
operates at the logical font level and does not guarantee that it
will map to a specific physical font. It is not guaranteed that GDI
will select the same physical font for displaying text formatted by a
LOGFONT as the IDWriteFont object that was converted.


%index
IDWriteGdiInterop_CreateFontFaceFromHdc
Creates an IDWriteFontFace object that corresponds to the currently selected HFONT of the specified HDC.
%group
COM misc / IDWriteGdiInterop
%prm
this, hdc, fontFace
this : [comobj] IDWriteGdiInterop インターフェースの COM オブジェクト変数
hdc : [intptr] Type: HDC A handle to a device context into which a font has been selected. It is assumed that the client has already performed font mapping and that the font selected into the device context is the actual font to be used for rendering glyphs.
fontFace : [comobj] Type: IDWriteFontFace** Contains an address of a pointer to  the newly created font face object, or NULL in case of failure. The font face returned is guaranteed to reference the same physical typeface that would be used for drawing glyphs (but not necessarily characters) using ExtTextOut.
%inst
Creates an IDWriteFontFace object that corresponds to the currently
selected HFONT of the specified HDC.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This function is intended for scenarios in which an application wants
to use GDI and Uniscribe 1.x for text layout and shaping, but
DirectWrite for final rendering. This function assumes the client is
performing text output using glyph indexes.


%index
IDWriteGdiInterop_CreateBitmapRenderTarget
Creates an object that encapsulates a bitmap and memory DC (device context) which can be used for rendering glyphs.
%group
COM misc / IDWriteGdiInterop
%prm
this, hdc, width, height, renderTarget
this : [comobj] IDWriteGdiInterop インターフェースの COM オブジェクト変数
hdc : [intptr] Type: HDC A handle to the optional device context used to create a compatible memory DC (device context).
width : [int] Type: UINT32 The width of the bitmap render target.
height : [int] Type: UINT32 The height of the bitmap render target.
renderTarget : [comobj] Type: IDWriteBitmapRenderTarget** When this method returns, contains an address of a pointer to the newly created IDWriteBitmapRenderTarget object.
%inst
Creates an object that encapsulates a bitmap and memory DC (device
context) which can be used for rendering glyphs.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteGlyphRunAnalysis_GetAlphaTextureBounds
Gets the bounding rectangle of the physical pixels affected by the glyph run.
%group
COM misc / IDWriteGlyphRunAnalysis
%prm
this, textureType, textureBounds
this : [comobj] IDWriteGlyphRunAnalysis インターフェースの COM オブジェクト変数
textureType : [int] Type: DWRITE_TEXTURE_TYPE Specifies the type of texture requested. If a bi-level texture is requested, the bounding rectangle includes only bi-level glyphs. Otherwise, the bounding rectangle includes only antialiased glyphs.
textureBounds : [var] Type: RECT* When this method returns, contains the bounding rectangle of the physical pixels affected by the glyph run, or an empty rectangle if there are no glyphs of the specified texture type.
%inst
Gets the bounding rectangle of the physical pixels affected by the
glyph run.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteGlyphRunAnalysis_CreateAlphaTexture
Creates an alpha texture of the specified type for glyphs within a specified bounding rectangle.
%group
COM misc / IDWriteGlyphRunAnalysis
%prm
this, textureType, textureBounds, alphaValues, bufferSize
this : [comobj] IDWriteGlyphRunAnalysis インターフェースの COM オブジェクト変数
textureType : [int] Type: DWRITE_TEXTURE_TYPE A value that specifies the type of texture requested. This can be DWRITE_TEXTURE_BILEVEL_1x1 or DWRITE_TEXTURE_CLEARTYPE_3x1. If a bi-level texture is requested, the texture contains only bi-level glyphs. Otherwise, the texture contains only antialiased glyphs.
textureBounds : [var] Type: const RECT* The bounding rectangle of the texture, which can be different than the bounding rectangle returned by GetAlphaTextureBounds.
alphaValues : [int] Type: BYTE* When this method returns, contains  the array of alpha values from the texture. The buffer allocated for this array must be at least the size of bufferSize.
bufferSize : [int] Type: UINT32 The size of the alphaValues array, in bytes. The minimum size depends on the dimensions of the rectangle and the type of texture requested.
%inst
Creates an alpha texture of the specified type for glyphs within a
specified bounding rectangle.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteGlyphRunAnalysis_GetAlphaBlendParams
Gets alpha blending properties required for ClearType blending.
%group
COM misc / IDWriteGlyphRunAnalysis
%prm
this, renderingParams, blendGamma, blendEnhancedContrast, blendClearTypeLevel
this : [comobj] IDWriteGlyphRunAnalysis インターフェースの COM オブジェクト変数
renderingParams : [comobj] Type: IDWriteRenderingParams* An object that specifies the ClearType level and enhanced contrast, gamma, pixel geometry, and rendering mode. In most cases, the values returned by the output parameters of this method are based on the properties of this object, unless a GDI-compatible rendering mode was specified.
blendGamma : [float] Type: FLOAT* When this method returns, contains  the gamma value to use for gamma correction.
blendEnhancedContrast : [float] Type: FLOAT* When this method returns, contains the enhanced contrast value to be used for blending.
blendClearTypeLevel : [float] Type: FLOAT* When this method returns, contains  the ClearType level used in the alpha blending.
%inst
Gets alpha blending properties required for ClearType blending.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteInlineObject_Draw
The application implemented rendering callback (IDWriteTextRenderer::DrawInlineObject) can use this to draw the inline object without needing to cast or query the object type. The text layout does not call this method directly.
%group
COM misc / IDWriteInlineObject
%prm
this, clientDrawingContext, renderer, originX, originY, isSideways, isRightToLeft, clientDrawingEffect
this : [comobj] IDWriteInlineObject インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] Type: void* The drawing context passed to IDWriteTextLayout::Draw.  This parameter may be NULL.
renderer : [comobj] Type: IDWriteTextRenderer* The same renderer passed to IDWriteTextLayout::Draw as the object's containing parent.  This is useful if the inline object is recursive such as a nested layout.
originX : [float] Type: FLOAT The x-coordinate at the upper-left corner of the inline object.
originY : [float] Type: FLOAT The y-coordinate at the upper-left corner of the inline object.
isSideways : [int] Type: BOOL A Boolean flag that indicates whether the object's baseline runs alongside the baseline axis of the line.
isRightToLeft : [int] Type: BOOL A Boolean flag that indicates whether the object is in a right-to-left context and should be drawn flipped.
clientDrawingEffect : [int] Type: IUnknown* The drawing effect set in IDWriteTextLayout::SetDrawingEffect.  Usually this effect is a foreground brush that  is used in glyph drawing.
%inst
The application implemented rendering callback
(IDWriteTextRenderer::DrawInlineObject) can use this to draw the
inline object without needing to cast or query the object type. The
text layout does not call this method directly.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteInlineObject_GetMetrics
IDWriteTextLayout calls this callback function to get the measurement of the inline object.
%group
COM misc / IDWriteInlineObject
%prm
this, metrics
this : [comobj] IDWriteInlineObject インターフェースの COM オブジェクト変数
metrics : [var] Type: DWRITE_INLINE_OBJECT_METRICS* When this method returns, contains a structure describing the geometric measurement of an application-defined inline object.  These metrics are in relation to the baseline of the adjacent text.
%inst
IDWriteTextLayout calls this callback function to get the measurement
of the inline object.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteInlineObject_GetOverhangMetrics
IDWriteTextLayout calls this callback function to get the visible extents (in DIPs) of the inline object. In the case of a simple bitmap, with no padding and no overhang, all the overhangs will simply be zeroes.
%group
COM misc / IDWriteInlineObject
%prm
this, overhangs
this : [comobj] IDWriteInlineObject インターフェースの COM オブジェクト変数
overhangs : [var] Type: **[**DWRITE\_OVERHANG\_METRICS**](/windows/win32/api/dwrite/ns-dwrite-dwrite_overhang_metrics)\*** Overshoot of visible extents (in DIPs) outside the object.
%inst
IDWriteTextLayout calls this callback function to get the visible
extents (in DIPs) of the inline object. In the case of a simple
bitmap, with no padding and no overhang, all the overhangs will
simply be zeroes.

[戻り値]
Type: **HRESULT** If this method succeeds, it returns **S\_OK**.
Otherwise, it returns an **HRESULT** error code.


%index
IDWriteInlineObject_GetBreakConditions
Layout uses this to determine the line-breaking behavior of the inline object among the text.
%group
COM misc / IDWriteInlineObject
%prm
this, breakConditionBefore, breakConditionAfter
this : [comobj] IDWriteInlineObject インターフェースの COM オブジェクト変数
breakConditionBefore : [var] Type: DWRITE_BREAK_CONDITION* When this method returns, contains a value which indicates the line-breaking condition between the object and the content immediately preceding it.
breakConditionAfter : [var] Type: DWRITE_BREAK_CONDITION* When this method returns, contains a value which indicates the line-breaking condition between the object and the content immediately following it.
%inst
Layout uses this to determine the line-breaking behavior of the
inline object among the text.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteLocalizedStrings_GetCount
Gets the number of language/string pairs.
%group
COM misc / IDWriteLocalizedStrings
%prm
this
this : [comobj] IDWriteLocalizedStrings インターフェースの COM オブジェクト変数
%inst
Gets the number of language/string pairs.

[戻り値]
Type: UINT32 The number of language/string pairs.


%index
IDWriteLocalizedStrings_FindLocaleName
Gets the zero-based index of the locale name/string pair with the specified locale name.
%group
COM misc / IDWriteLocalizedStrings
%prm
this, localeName, index, exists
this : [comobj] IDWriteLocalizedStrings インターフェースの COM オブジェクト変数
localeName : [wstr] Type: const WCHAR* A null-terminated array of characters containing the locale name to look for.
index : [int] Type: UINT32* The zero-based index of the locale name/string pair. This method initializes index to UINT_MAX.
exists : [var] Type: BOOL* When this method returns, contains TRUE if the locale name exists; otherwise, FALSE. This method initializes exists to FALSE.
%inst
Gets the zero-based index of the locale name/string pair with the
specified locale name.

[戻り値]
Type: HRESULT If the specified locale name does not exist, the return
value is S_OK, but index is UINT_MAX and exists is FALSE.

[備考]
Note that if the locale name does not exist, the return value is a
success and the exists parameter is FALSE. If you are getting the
font family name for a font and the specified locale name does not
exist, one option is to set the index to 0 as shown below. There is
always at least one locale for a font family.
This doc was truncated.


%index
IDWriteLocalizedStrings_GetLocaleNameLength
Gets the length in characters (not including the null terminator) of the locale name with the specified index. (IDWriteLocalizedStrings.GetLocaleNameLength)
%group
COM misc / IDWriteLocalizedStrings
%prm
this, index, length
this : [comobj] IDWriteLocalizedStrings インターフェースの COM オブジェクト変数
index : [int] Type: UINT32 Zero-based index of the locale name to be retrieved.
length : [int] Type: UINT32* When this method returns, contains the length in characters of the locale name, not including the null terminator.
%inst
Gets the length in characters (not including the null terminator) of
the locale name with the specified index.
(IDWriteLocalizedStrings.GetLocaleNameLength)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteLocalizedStrings_GetLocaleName
Copies the locale name with the specified index to the specified array. (IDWriteLocalizedStrings.GetLocaleName)
%group
COM misc / IDWriteLocalizedStrings
%prm
this, index, localeName, size
this : [comobj] IDWriteLocalizedStrings インターフェースの COM オブジェクト変数
index : [int] Type: UINT32 Zero-based index of the locale name to be retrieved.
localeName : [wstr] Type: WCHAR* When this method returns, contains a character array, which is null-terminated, that receives the locale name from the language/string pair.  The buffer allocated for this array must be at least the size of size, in element count.
size : [int] Type: UINT32 The size of the array in characters. The size must include space for the terminating null character.
%inst
Copies the locale name with the specified index to the specified
array. (IDWriteLocalizedStrings.GetLocaleName)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteLocalizedStrings_GetStringLength
Gets the length in characters (not including the null terminator) of the string with the specified index. (IDWriteLocalizedStrings.GetStringLength)
%group
COM misc / IDWriteLocalizedStrings
%prm
this, index, length
this : [comobj] IDWriteLocalizedStrings インターフェースの COM オブジェクト変数
index : [int] Type: UINT32 A zero-based index of the language/string pair.
length : [int] Type: UINT32* The length in characters of the string, not including the null terminator, from the language/string pair.
%inst
Gets the length in characters (not including the null terminator) of
the string with the specified index.
(IDWriteLocalizedStrings.GetStringLength)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Use GetStringLength to get the string length before calling the
IDWriteLocalizedStrings::GetString method, as shown in the following
code.
This doc was truncated.


%index
IDWriteLocalizedStrings_GetString
Copies the string with the specified index to the specified array. (IDWriteLocalizedStrings.GetString)
%group
COM misc / IDWriteLocalizedStrings
%prm
this, index, stringBuffer, size
this : [comobj] IDWriteLocalizedStrings インターフェースの COM オブジェクト変数
index : [int] Type: UINT32 The zero-based index of the language/string pair to be examined.
stringBuffer : [wstr] Type: WCHAR* The null terminated array of characters that receives the string from the language/string pair.  The buffer allocated for this array should be at least the size of size. GetStringLength can be used to get the size of the array before using this method.
size : [int] Type: UINT32 The size of the array in characters. The size must include space for the terminating null character. GetStringLength can be used to get the size of the array before using this method.
%inst
Copies the string with the specified index to the specified array.
(IDWriteLocalizedStrings.GetString)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The string returned must be allocated by the caller. You can get the
size of the string by using the GetStringLength method prior to
calling GetString, as shown in the following example.
This doc was truncated.


%index
IDWritePixelSnapping_IsPixelSnappingDisabled
IDWritePixelSnapping::IsPixelSnappingDisabled (vtable slot 3)
%group
COM misc / IDWritePixelSnapping
%prm
this, clientDrawingContext, isDisabled
this : [comobj] IDWritePixelSnapping インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] 
isDisabled : [var] 
%inst


%index
IDWritePixelSnapping_GetCurrentTransform
Gets a transform that maps abstract coordinates to DIPs.
%group
COM misc / IDWritePixelSnapping
%prm
this, clientDrawingContext, transform
this : [comobj] IDWritePixelSnapping インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] Type: void* The drawing context passed to IDWriteTextLayout::Draw.
transform : [var] Type: DWRITE_MATRIX* When this method returns, contains a structure which has transform information for  pixel snapping.
%inst
Gets a transform that maps abstract coordinates to DIPs.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWritePixelSnapping_GetPixelsPerDip
Gets the number of physical pixels per DIP.
%group
COM misc / IDWritePixelSnapping
%prm
this, clientDrawingContext, pixelsPerDip
this : [comobj] IDWritePixelSnapping インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] Type: void* The drawing context passed to IDWriteTextLayout::Draw.
pixelsPerDip : [float] Type: FLOAT* When this method returns, contains the number of physical pixels per DIP.
%inst
Gets the number of physical pixels per DIP.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Because a DIP (device-independent pixel) is 1/96 inch, the
pixelsPerDip value is the number of logical pixels per inch divided
by 96.


%index
IDWriteRenderingParams_GetGamma
Gets the gamma value used for gamma correction. Valid values must be greater than zero and cannot exceed 256.
%group
COM misc / IDWriteRenderingParams
%prm
this
this : [comobj] IDWriteRenderingParams インターフェースの COM オブジェクト変数
%inst
Gets the gamma value used for gamma correction. Valid values must be
greater than zero and cannot exceed 256.

[戻り値]
Type: FLOAT Returns the gamma value used for gamma correction. Valid
values must be greater than zero and cannot exceed 256.

[備考]
The gamma value is used for gamma correction, which compensates for
the non-linear luminosity response of most monitors.


%index
IDWriteRenderingParams_GetEnhancedContrast
Gets the enhanced contrast property of the rendering parameters object. Valid values are greater than or equal to zero.
%group
COM misc / IDWriteRenderingParams
%prm
this
this : [comobj] IDWriteRenderingParams インターフェースの COM オブジェクト変数
%inst
Gets the enhanced contrast property of the rendering parameters
object. Valid values are greater than or equal to zero.

[戻り値]
Type: FLOAT Returns the amount of contrast enhancement. Valid values
are greater than or equal to zero.

[備考]
Enhanced contrast is the amount to increase the darkness of text, and
typically ranges from 0 to 1. Zero means no contrast enhancement.


%index
IDWriteRenderingParams_GetClearTypeLevel
Gets the ClearType level of the rendering parameters object.
%group
COM misc / IDWriteRenderingParams
%prm
this
this : [comobj] IDWriteRenderingParams インターフェースの COM オブジェクト変数
%inst
Gets the ClearType level of the rendering parameters object.

[戻り値]
Type: FLOAT The ClearType level of the rendering parameters object.

[備考]
The ClearType level represents the amount of ClearType ? that is, the
degree to which the red, green, and blue subpixels of each pixel are
treated differently. Valid values range from zero (meaning no
ClearType, which is equivalent to grayscale anti-aliasing) to one
(meaning full ClearType)


%index
IDWriteRenderingParams_GetPixelGeometry
Gets the pixel geometry of the rendering parameters object.
%group
COM misc / IDWriteRenderingParams
%prm
this
this : [comobj] IDWriteRenderingParams インターフェースの COM オブジェクト変数
%inst
Gets the pixel geometry of the rendering parameters object.

[戻り値]
Type: DWRITE_PIXEL_GEOMETRY A value that indicates the type of pixel
geometry used in the rendering parameters object.


%index
IDWriteRenderingParams_GetRenderingMode
Gets the rendering mode of the rendering parameters object.
%group
COM misc / IDWriteRenderingParams
%prm
this
this : [comobj] IDWriteRenderingParams インターフェースの COM オブジェクト変数
%inst
Gets the rendering mode of the rendering parameters object.

[戻り値]
Type: DWRITE_RENDERING_MODE A value that indicates the rendering mode
of the rendering parameters object.

[備考]
By default, the rendering mode is initialized to
DWRITE_RENDERING_MODE_DEFAULT, which means the rendering mode is
determined automatically based on the font and size. To determine the
recommended rendering mode to use for a given font and size and
rendering parameters object, use the
IDWriteFontFace::GetRecommendedRenderingMode method.


%index
IDWriteTextAnalysisSink_SetScriptAnalysis
Reports script analysis for the specified text range.
%group
COM misc / IDWriteTextAnalysisSink
%prm
this, textPosition, textLength, scriptAnalysis
this : [comobj] IDWriteTextAnalysisSink インターフェースの COM オブジェクト変数
textPosition : [int] Type: UINT32 The starting position from which to report.
textLength : [int] Type: UINT32 The number of UTF16 units of the reported range.
scriptAnalysis : [var] Type: const DWRITE_SCRIPT_ANALYSIS* A pointer to a structure that contains a zero-based index representation of a writing system script and a value indicating whether additional shaping of text is required.
%inst
Reports script analysis for the specified text range.

[戻り値]
Type: HRESULT A successful code or error code to stop analysis.


%index
IDWriteTextAnalysisSink_SetLineBreakpoints
Sets line-break opportunities for each character, starting from the specified position.
%group
COM misc / IDWriteTextAnalysisSink
%prm
this, textPosition, textLength, lineBreakpoints
this : [comobj] IDWriteTextAnalysisSink インターフェースの COM オブジェクト変数
textPosition : [int] Type: UINT32 The starting text position from which to report.
textLength : [int] Type: UINT32 The number of UTF16 units of the reported range.
lineBreakpoints : [var] Type: DWRITE_LINE_BREAKPOINT* A pointer to a structure that contains breaking conditions set for each character from the starting position to the end of the specified range.
%inst
Sets line-break opportunities for each character, starting from the
specified position.

[戻り値]
Type: HRESULT A successful code or error code to stop analysis.


%index
IDWriteTextAnalysisSink_SetBidiLevel
Sets a bidirectional level on the range, which is called once per run change (either explicit or resolved implicit).
%group
COM misc / IDWriteTextAnalysisSink
%prm
this, textPosition, textLength, explicitLevel, resolvedLevel
this : [comobj] IDWriteTextAnalysisSink インターフェースの COM オブジェクト変数
textPosition : [int] Type: UINT32 The starting position from which to report.
textLength : [int] Type: UINT32 The number of UTF16 units of the reported range.
explicitLevel : [int] Type: UINT8 The explicit level from the paragraph reading direction and any embedded control codes RLE/RLO/LRE/LRO/PDF, which is determined before any additional rules.
resolvedLevel : [int] Type: UINT8 The final implicit level considering the explicit level and characters' natural directionality, after all Bidi rules have been applied.
%inst
Sets a bidirectional level on the range, which is called once per run
change (either explicit or resolved implicit).

[戻り値]
Type: HRESULT A successful code or error code to stop analysis.


%index
IDWriteTextAnalysisSink_SetNumberSubstitution
Sets the number substitution on the text range affected by the text analysis.
%group
COM misc / IDWriteTextAnalysisSink
%prm
this, textPosition, textLength, numberSubstitution
this : [comobj] IDWriteTextAnalysisSink インターフェースの COM オブジェクト変数
textPosition : [int] Type: UINT32 The starting position from which to report.
textLength : [int] Type: UINT32 The number of UTF16 units of the reported range.
numberSubstitution : [comobj] Type: IDWriteNumberSubstitution* An object that holds the appropriate digits and numeric punctuation for a given locale. Use IDWriteFactory::CreateNumberSubstitution to create this object.
%inst
Sets the number substitution on the text range affected by the text
analysis.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextAnalysisSource_GetTextAtPosition
Gets a block of text starting at the specified text position.
%group
COM misc / IDWriteTextAnalysisSource
%prm
this, textPosition, textString, textLength
this : [comobj] IDWriteTextAnalysisSource インターフェースの COM オブジェクト変数
textPosition : [int] Type: UINT32 The first position of the piece to obtain. All positions are in UTF16 code units, not whole characters, which matters when supplementary characters are used.
textString : [var] Type: const WCHAR** When this method returns, contains an address of  the block of text as an array of characters to be retrieved from the text analysis.
textLength : [int] Type: UINT32* When this method returns, contains the number of UTF16 units of the retrieved chunk. The returned length is not the length of the block, but the length     remaining in the block, from the specified position until its end. For example, querying for a position that is 75 positions into a 100-position block would return 25.
%inst
Gets a block of text starting at the specified text position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Returning NULL indicates the end of text, which is the position after
the last character. This function is called iteratively for each
consecutive block, tying together several fragmented blocks in the
backing store into a virtual contiguous string. Although applications
can implement sparse textual content that maps only part of the
backing store, the application must map any text that is in the range
passed to any analysis functions.


%index
IDWriteTextAnalysisSource_GetTextBeforePosition
Gets a block of text immediately preceding the specified position.
%group
COM misc / IDWriteTextAnalysisSource
%prm
this, textPosition, textString, textLength
this : [comobj] IDWriteTextAnalysisSource インターフェースの COM オブジェクト変数
textPosition : [int] Type: UINT32 The position immediately after the last position of the block of text to obtain.
textString : [var] Type: const WCHAR** When this method returns, contains an address of a pointer to the block of text, as an array of characters from the specified range.  The text range will be from textPosition to the front of the block.
textLength : [int] Type: UINT32* Number of UTF16 units of the retrieved block. The length returned is from the specified position to the front of the block.
%inst
Gets a block of text immediately preceding the specified position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
NULL indicates no chunk available at the specified position, either
because textPosition equals 0, textPosition is greater than the
entire text content length, or the queried position is not mapped
into the application's backing store. Although applications can
implement sparse textual content that maps only part of the backing
store, the application must map any text that is in the range passed
to any analysis functions.


%index
IDWriteTextAnalysisSource_GetParagraphReadingDirection
Gets the paragraph reading direction.
%group
COM misc / IDWriteTextAnalysisSource
%prm
this
this : [comobj] IDWriteTextAnalysisSource インターフェースの COM オブジェクト変数
%inst
Gets the paragraph reading direction.

[戻り値]
Type: DWRITE_READING_DIRECTION The reading direction of the current
paragraph.


%index
IDWriteTextAnalysisSource_GetLocaleName
Gets the locale name on the range affected by the text analysis.
%group
COM misc / IDWriteTextAnalysisSource
%prm
this, textPosition, textLength, localeName
this : [comobj] IDWriteTextAnalysisSource インターフェースの COM オブジェクト変数
textPosition : [int] Type: UINT32 The text position to examine.
textLength : [int] Type: UINT32* Contains the length of the text being affected by the text analysis up to the next differing locale.
localeName : [var] Type: const WCHAR** Contains an address of a  pointer to an array of characters which receives the locale name from the text affected by the text analysis. The array of characters is null-terminated.
%inst
Gets the locale name on the range affected by the text analysis.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The localeName pointer must remain valid until the next call or until
the analysis returns.


%index
IDWriteTextAnalysisSource_GetNumberSubstitution
Gets the number substitution from the text range affected by the text analysis.
%group
COM misc / IDWriteTextAnalysisSource
%prm
this, textPosition, textLength, numberSubstitution
this : [comobj] IDWriteTextAnalysisSource インターフェースの COM オブジェクト変数
textPosition : [int] Type: UINT32 The starting position from which to report.
textLength : [int] Type: UINT32* Contains  the length of the text, in characters, remaining in the text range up to the next differing number substitution.
numberSubstitution : [comobj] Type: IDWriteNumberSubstitution** Contains an address of a pointer to an object, which was created with IDWriteFactory::CreateNumberSubstitution, that holds the appropriate digits and numeric punctuation for a given locale.
%inst
Gets the number substitution from the text range affected by the text
analysis.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Any implementation should return the number substitution with an
incremented reference count, and the analysis will release when
finished with it (either before the next call or before it returns).
However, the sink callback may hold onto it after that.


%index
IDWriteTextAnalyzer_AnalyzeScript
Analyzes a text range for script boundaries, reading text attributes from the source and reporting the Unicode script ID to the sink callback SetScript.
%group
COM misc / IDWriteTextAnalyzer
%prm
this, analysisSource, textPosition, textLength, analysisSink
this : [comobj] IDWriteTextAnalyzer インターフェースの COM オブジェクト変数
analysisSource : [comobj] Type: IDWriteTextAnalysisSource* A pointer to the source object to analyze.
textPosition : [int] Type: UINT32 The starting text position within the source object.
textLength : [int] Type: UINT32 The text length to analyze.
analysisSink : [comobj] Type: IDWriteTextAnalysisSink* A pointer to the sink callback object that receives the text analysis.
%inst
Analyzes a text range for script boundaries, reading text attributes
from the source and reporting the Unicode script ID to the sink
callback SetScript.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextAnalyzer_AnalyzeBidi
Analyzes a text range for script directionality, reading attributes from the source and reporting levels to the sink callback SetBidiLevel.
%group
COM misc / IDWriteTextAnalyzer
%prm
this, analysisSource, textPosition, textLength, analysisSink
this : [comobj] IDWriteTextAnalyzer インターフェースの COM オブジェクト変数
analysisSource : [comobj] Type: IDWriteTextAnalysisSource* A pointer to a source object to analyze.
textPosition : [int] Type: UINT32 The starting text position within the source object.
textLength : [int] Type: UINT32 The text length to analyze.
analysisSink : [comobj] Type: IDWriteTextAnalysisSink* A pointer to the sink callback object that receives the text analysis.
%inst
Analyzes a text range for script directionality, reading attributes
from the source and reporting levels to the sink callback
SetBidiLevel.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
While the function can handle multiple paragraphs, the text range
should not arbitrarily split the middle of paragraphs. Otherwise, the
returned levels may be wrong, because the Bidi algorithm is meant to
apply to the paragraph as a whole.


%index
IDWriteTextAnalyzer_AnalyzeNumberSubstitution
Analyzes a text range for spans where number substitution is applicable, reading attributes from the source and reporting substitutable ranges to the sink callback SetNumberSubstitution.
%group
COM misc / IDWriteTextAnalyzer
%prm
this, analysisSource, textPosition, textLength, analysisSink
this : [comobj] IDWriteTextAnalyzer インターフェースの COM オブジェクト変数
analysisSource : [comobj] Type: IDWriteTextAnalysisSource* The source object to analyze.
textPosition : [int] Type: UINT32 The starting position within the source object.
textLength : [int] Type: UINT32 The length to analyze.
analysisSink : [comobj] Type: IDWriteTextAnalysisSink* A pointer to the sink callback object that receives the text analysis.
%inst
Analyzes a text range for spans where number substitution is
applicable, reading attributes from the source and reporting
substitutable ranges to the sink callback SetNumberSubstitution.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Although the function can handle multiple ranges of differing number
substitutions, the text ranges should not arbitrarily split the
middle of numbers. Otherwise, it will treat the numbers separately
and will not translate any intervening punctuation.


%index
IDWriteTextAnalyzer_AnalyzeLineBreakpoints
Analyzes a text range for potential breakpoint opportunities, reading attributes from the source and reporting breakpoint opportunities to the sink callback SetLineBreakpoints.
%group
COM misc / IDWriteTextAnalyzer
%prm
this, analysisSource, textPosition, textLength, analysisSink
this : [comobj] IDWriteTextAnalyzer インターフェースの COM オブジェクト変数
analysisSource : [comobj] Type: IDWriteTextAnalysisSource* A pointer to the source object to analyze.
textPosition : [int] Type: UINT32 The starting text position within the source object.
textLength : [int] Type: UINT32 The text length to analyze.
analysisSink : [comobj] Type: IDWriteTextAnalysisSink* A pointer to the  sink callback object that receives the text analysis.
%inst
Analyzes a text range for potential breakpoint opportunities, reading
attributes from the source and reporting breakpoint opportunities to
the sink callback SetLineBreakpoints.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Although the function can handle multiple paragraphs, the text range
should not arbitrarily split the middle of paragraphs, unless the
specified text span is considered a whole unit. Otherwise, the
returned properties for the first and last characters will
inappropriately allow breaks.


%index
IDWriteTextAnalyzer_GetGlyphs
Parses the input text string and maps it to the set of glyphs and associated glyph data according to the font and the writing system's rendering rules.
%group
COM misc / IDWriteTextAnalyzer
%prm
this, textString, textLength, fontFace, isSideways, isRightToLeft, scriptAnalysis, localeName, numberSubstitution, features, featureRangeLengths, featureRanges, maxGlyphCount, clusterMap, textProps, glyphIndices, glyphProps, actualGlyphCount
this : [comobj] IDWriteTextAnalyzer インターフェースの COM オブジェクト変数
textString : [wstr] Type: const WCHAR* An array of characters to convert to glyphs.
textLength : [int] Type: UINT32 The length of textString.
fontFace : [comobj] Type: IDWriteFontFace* The font face that is the source of the output glyphs.
isSideways : [int] Type: BOOL A Boolean flag set to TRUE if the text is intended to be drawn vertically.
isRightToLeft : [int] Type: BOOL A Boolean flag set to TRUE for right-to-left text.
scriptAnalysis : [var] Type: const DWRITE_SCRIPT_ANALYSIS* A pointer to a Script analysis result from an AnalyzeScript call.
localeName : [wstr] Type: const WCHAR* The locale to use when selecting glyphs. For example the same character may map to different glyphs for ja-jp versus zh-chs. If this is NULL, then the default mapping based on the script is used.
numberSubstitution : [comobj] Type: IDWriteNumberSubstitution* A pointer to an optional number substitution which selects the appropriate glyphs for digits and related numeric characters, depending on the results obtained from AnalyzeNumberSubstitution. Passing NULL indicates that no substitution is needed and that the digits should receive nominal glyphs.
features : [var] Type: const DWRITE_TYPOGRAPHIC_FEATURES** An array of pointers to the sets of typographic features to use in each feature range.
featureRangeLengths : [var] Type: const UINT32* The length of each feature range, in characters. The sum of all lengths should be equal to textLength.
featureRanges : [int] Type: UINT32 The number of feature ranges.
maxGlyphCount : [int] Type: UINT32 The maximum number of glyphs that can be returned.
clusterMap : [int] Type: UINT16* When this method returns, contains the mapping from character ranges to glyph ranges.
textProps : [var] Type: DWRITE_SHAPING_TEXT_PROPERTIES* When this method returns, contains a pointer to an array of structures that contains  shaping properties for each character.
glyphIndices : [int] Type: UINT16* The output glyph indices.
glyphProps : [var] Type: DWRITE_SHAPING_GLYPH_PROPERTIES* When this method returns, contains a pointer to an array of structures that contain  shaping properties for each output glyph.
actualGlyphCount : [int] Type: UINT32* When this method returns, contains the actual number of glyphs returned if the call succeeds.
%inst
Parses the input text string and maps it to the set of glyphs and
associated glyph data according to the font and the writing system's
rendering rules.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Note that the mapping from characters to glyphs is, in general,
many-to-many. The recommended estimate for the per-glyph output
buffers is (3 * textLength / 2 + 16). This is not guaranteed to be
sufficient. The value of the actualGlyphCount parameter is only valid
if the call succeeds. In the event that maxGlyphCount is not big
enough, HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER) will be
returned. The application should allocate a larger buffer and try
again.


%index
IDWriteTextAnalyzer_GetGlyphPlacements
Places glyphs output from the GetGlyphs method according to the font and the writing system's rendering rules.
%group
COM misc / IDWriteTextAnalyzer
%prm
this, textString, clusterMap, textProps, textLength, glyphIndices, glyphProps, glyphCount, fontFace, fontEmSize, isSideways, isRightToLeft, scriptAnalysis, localeName, features, featureRangeLengths, featureRanges, glyphAdvances, glyphOffsets
this : [comobj] IDWriteTextAnalyzer インターフェースの COM オブジェクト変数
textString : [wstr] Type: const WCHAR* An array of characters containing the original string from which the glyphs came.
clusterMap : [int] Type: const UINT16* A pointer to the mapping from character ranges to glyph ranges. This is returned by GetGlyphs.
textProps : [var] Type: DWRITE_SHAPING_TEXT_PROPERTIES* A pointer to an array of structures that contains  shaping properties for each character. This structure is returned by GetGlyphs.
textLength : [int] Type: UINT32 The text length of textString.
glyphIndices : [int] Type: const UINT16* An array of glyph indices returned by GetGlyphs.
glyphProps : [var] Type: const DWRITE_SHAPING_GLYPH_PROPERTIES* A pointer to an array of structures that contain  shaping properties for each glyph returned by GetGlyphs.
glyphCount : [int] Type: UINT32 The number of glyphs returned from GetGlyphs.
fontFace : [comobj] Type: IDWriteFontFace* A pointer to the font face that is the source for the output glyphs.
fontEmSize : [float] Type: FLOAT The logical font size in DIPs.
isSideways : [int] Type: BOOL A Boolean flag set to TRUE if the text is intended to be drawn vertically.
isRightToLeft : [int] Type: BOOL A Boolean flag set to TRUE for right-to-left text.
scriptAnalysis : [var] Type: const DWRITE_SCRIPT_ANALYSIS* A pointer to a Script analysis result from an AnalyzeScript call.
localeName : [wstr] Type: const WCHAR* An array of characters containing the locale to use when selecting glyphs. For example, the same character may map to different glyphs for ja-jp versus zh-chs. If this is NULL, the default mapping based on the script is used.
features : [var] Type: const DWRITE_TYPOGRAPHIC_FEATURES** An array of pointers to the sets of typographic features to use in each feature range.
featureRangeLengths : [var] Type: const UINT32* The length of each feature range, in characters. The sum of all lengths should be equal to textLength.
featureRanges : [int] Type: UINT32 The number of feature ranges.
glyphAdvances : [float] Type: FLOAT* When this method returns, contains the advance width of each glyph.
glyphOffsets : [var] Type: DWRITE_GLYPH_OFFSET* When this method returns, contains the offset of the origin of each glyph.
%inst
Places glyphs output from the GetGlyphs method according to the font
and the writing system's rendering rules.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextAnalyzer_GetGdiCompatibleGlyphPlacements
Place glyphs output from the GetGlyphs method according to the font and the writing system's rendering rules.
%group
COM misc / IDWriteTextAnalyzer
%prm
this, textString, clusterMap, textProps, textLength, glyphIndices, glyphProps, glyphCount, fontFace, fontEmSize, pixelsPerDip, transform, useGdiNatural, isSideways, isRightToLeft, scriptAnalysis, localeName, features, featureRangeLengths, featureRanges, glyphAdvances, glyphOffsets
this : [comobj] IDWriteTextAnalyzer インターフェースの COM オブジェクト変数
textString : [wstr] Type: **const WCHAR\*** An array of characters containing the original string from which the glyphs came.
clusterMap : [int] Type: **const UINT16\*** A pointer to the mapping from character ranges to glyph ranges. This is returned by [**GetGlyphs**](/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs).
textProps : [var] Type: **[**DWRITE\_SHAPING\_TEXT\_PROPERTIES**](/windows/win32/api/dwrite/ns-dwrite-dwrite_shaping_text_properties)\*** A pointer to an array of structures that contains shaping properties for each character. This structure is returned by [**GetGlyphs**](/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs).
textLength : [int] Type: **UINT32** The text length of *textString*.
glyphIndices : [int] Type: **const UINT16\*** An array of glyph indices returned by [**GetGlyphs**](/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs).
glyphProps : [var] Type: **const [**DWRITE\_SHAPING\_GLYPH\_PROPERTIES**](/windows/win32/api/dwrite/ns-dwrite-dwrite_shaping_glyph_properties)\*** A pointer to an array of structures that contain shaping properties for each glyph returned by [**GetGlyphs**](/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs).
glyphCount : [int] Type: **UINT32** The number of glyphs returned from [**GetGlyphs**](/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs).
fontFace : [comobj] Type: **[**IDWriteFontFace**](/windows/win32/api/dwrite/nn-dwrite-idwritefontface)\*** A pointer to the font face that is the source for the output glyphs.
fontEmSize : [float] Type: **FLOAT** The logical font size in DIPs.
pixelsPerDip : [float] Type: **FLOAT** The number of physical pixels per DIP.
transform : [var] Type: **const [**DWRITE\_MATRIX**](/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix)\*** An optional transform applied to the glyphs and their positions. This transform is applied after the scaling specified by the font size and *pixelsPerDip*.
useGdiNatural : [int] Type: **BOOL** When set to **FALSE**, the metrics are the same as the metrics of GDI aliased text. When set to **TRUE**, the metrics are the same as the metrics of text measured by GDI using a font created with **CLEARTYPE\_NATURAL\_QUALITY**.
isSideways : [int] Type: **BOOL** A Boolean flag set to **TRUE** if the text is intended to be drawn vertically.
isRightToLeft : [int] Type: **BOOL** A Boolean flag set to **TRUE** for right-to-left text.
scriptAnalysis : [var] Type: **const [**DWRITE\_SCRIPT\_ANALYSIS**](/windows/win32/api/dwrite/ns-dwrite-dwrite_script_analysis)\*** A pointer to a Script analysis result from an[**AnalyzeScript**](/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-analyzescript) call.
localeName : [wstr] Type: **const WCHAR\*** An array of characters containing the locale to use when selecting glyphs. For example, the same character may map to different glyphs for ja-jp versus zh-chs. If this is **NULL**, then the default mapping based on the script is used.
features : [var] Type: **const [**DWRITE\_TYPOGRAPHIC\_FEATURES**](/windows/win32/api/dwrite/ns-dwrite-dwrite_typographic_features)\*\*** An array of pointers to the sets of typographic features to use in each feature range.
featureRangeLengths : [var] Type: **const UINT32\*** The length of each feature range, in characters. The sum of all lengths should be equal to *textLength*.
featureRanges : [int] Type: **UINT32** The number of feature ranges.
glyphAdvances : [float] Type: **FLOAT\*** When this method returns, contains the advance width of each glyph.
glyphOffsets : [var] Type: **[**DWRITE\_GLYPH\_OFFSET**](/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_offset)\*** When this method returns, contains the offset of the origin of each glyph.
%inst
Place glyphs output from the GetGlyphs method according to the font
and the writing system's rendering rules.

[戻り値]
Type: **HRESULT** If this method succeeds, it returns **S\_OK**.
Otherwise, it returns an **HRESULT** error code.


%index
IDWriteTextFormat_SetTextAlignment
Sets the alignment of text in a paragraph, relative to the leading and trailing edge of a layout box for a IDWriteTextFormat interface.
%group
COM misc / IDWriteTextFormat
%prm
this, textAlignment
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
textAlignment : [int] Type: DWRITE_TEXT_ALIGNMENT The text alignment option being set for the paragraph of type DWRITE_TEXT_ALIGNMENT.  For more information, see Remarks.
%inst
Sets the alignment of text in a paragraph, relative to the leading
and trailing edge of a layout box for a IDWriteTextFormat interface.

[戻り値]
Type: HRESULT This method can return one of these values.
This doc was truncated.

[備考]
The text can be aligned to the leading or trailing edge of the layout
box, or it can be centered. The following illustration shows text
with the alignment set to DWRITE_TEXT_ALIGNMENT_LEADING,
DWRITE_TEXT_ALIGNMENT_CENTER, and DWRITE_TEXT_ALIGNMENT_TRAILING,
respectively.
This doc was truncated.


%index
IDWriteTextFormat_SetParagraphAlignment
Sets the alignment option of a paragraph relative to the layout box's top and bottom edge.
%group
COM misc / IDWriteTextFormat
%prm
this, paragraphAlignment
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
paragraphAlignment : [int] Type: DWRITE_PARAGRAPH_ALIGNMENT The paragraph alignment option being set for a paragraph; see DWRITE_PARAGRAPH_ALIGNMENT for more information.
%inst
Sets the alignment option of a paragraph relative to the layout box's
top and bottom edge.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextFormat_SetWordWrapping
Sets the word wrapping option.
%group
COM misc / IDWriteTextFormat
%prm
this, wordWrapping
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
wordWrapping : [int] Type: DWRITE_WORD_WRAPPING The word wrapping option being set for a paragraph; see DWRITE_WORD_WRAPPING for more information.
%inst
Sets the word wrapping option.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextFormat_SetReadingDirection
Sets the paragraph reading direction.
%group
COM misc / IDWriteTextFormat
%prm
this, readingDirection
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
readingDirection : [int] Type: DWRITE_READING_DIRECTION The text reading direction (for example, DWRITE_READING_DIRECTION_RIGHT_TO_LEFT for languages, such as Arabic, that read from right to left) for a paragraph.
%inst
Sets the paragraph reading direction.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The reading direction and flow direction must always be set 90
degrees orthogonal to each other, or else you will get the error
DWRITE_E_FLOWDIRECTIONCONFLICTS when you use layout functions like
Draw or GetMetrics. So if you set a vertical reading direction (for
example, to DWRITE_READING_DIRECTION_TOP_TO_BOTTOM), then you must
also use SetFlowDirection to set the flow direction appropriately
(for example, to DWRITE_FLOW_DIRECTION_RIGHT_TO_LEFT).


%index
IDWriteTextFormat_SetFlowDirection
Sets the paragraph flow direction.
%group
COM misc / IDWriteTextFormat
%prm
this, flowDirection
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
flowDirection : [int] Type: DWRITE_FLOW_DIRECTION The paragraph flow direction; see DWRITE_FLOW_DIRECTION for more information.
%inst
Sets the paragraph flow direction.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextFormat_SetIncrementalTabStop
Sets a fixed distance between two adjacent tab stops.
%group
COM misc / IDWriteTextFormat
%prm
this, incrementalTabStop
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
incrementalTabStop : [float] Type: FLOAT The fixed distance between two adjacent tab stops.
%inst
Sets a fixed distance between two adjacent tab stops.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextFormat_SetTrimming
Sets trimming options for text overflowing the layout width.
%group
COM misc / IDWriteTextFormat
%prm
this, trimmingOptions, trimmingSign
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
trimmingOptions : [var] Type: const DWRITE_TRIMMING* Text trimming options.
trimmingSign : [comobj] Type: IDWriteInlineObject* Application-defined omission sign. This parameter may be NULL. See IDWriteInlineObject for more information.
%inst
Sets trimming options for text overflowing the layout width.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextFormat_SetLineSpacing
Sets the line spacing.
%group
COM misc / IDWriteTextFormat
%prm
this, lineSpacingMethod, lineSpacing, baseline
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
lineSpacingMethod : [int] Type: DWRITE_LINE_SPACING_METHOD Specifies how line height is being determined; see DWRITE_LINE_SPACING_METHOD for more information.
lineSpacing : [float] Type: FLOAT The line height, or distance between one baseline to another.
baseline : [float] Type: FLOAT The distance from top of line to baseline. A reasonable ratio to lineSpacing is 80 percent.
%inst
Sets the line spacing.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
For the default method, spacing depends solely on the content. For
uniform spacing, the specified line height overrides the content.


%index
IDWriteTextFormat_GetTextAlignment
Gets the alignment option of text relative to the layout box's leading and trailing edge.
%group
COM misc / IDWriteTextFormat
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
Gets the alignment option of text relative to the layout box's
leading and trailing edge.

[戻り値]
Type: DWRITE_TEXT_ALIGNMENT Returns the text alignment option of the
current paragraph.


%index
IDWriteTextFormat_GetParagraphAlignment
Gets the alignment option of a paragraph which is relative to the top and bottom edges of a layout box.
%group
COM misc / IDWriteTextFormat
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
Gets the alignment option of a paragraph which is relative to the top
and bottom edges of a layout box.

[戻り値]
Type: DWRITE_PARAGRAPH_ALIGNMENT A value that indicates the current
paragraph alignment option.


%index
IDWriteTextFormat_GetWordWrapping
Gets the word wrapping option.
%group
COM misc / IDWriteTextFormat
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
Gets the word wrapping option.

[戻り値]
Type: DWRITE_WORD_WRAPPING Returns the word wrapping option; see
DWRITE_WORD_WRAPPING for more information.


%index
IDWriteTextFormat_GetReadingDirection
Gets the current reading direction for text in a paragraph.
%group
COM misc / IDWriteTextFormat
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
Gets the current reading direction for text in a paragraph.

[戻り値]
Type: DWRITE_READING_DIRECTION A value that indicates the current
reading direction for text in a paragraph.


%index
IDWriteTextFormat_GetFlowDirection
Gets the direction that text lines flow.
%group
COM misc / IDWriteTextFormat
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
Gets the direction that text lines flow.

[戻り値]
Type: DWRITE_FLOW_DIRECTION The direction that text lines flow within
their parent container. For example,
DWRITE_FLOW_DIRECTION_TOP_TO_BOTTOM indicates that text lines are
placed from top to bottom.


%index
IDWriteTextFormat_GetIncrementalTabStop
Gets the incremental tab stop position.
%group
COM misc / IDWriteTextFormat
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
Gets the incremental tab stop position.

[戻り値]
Type: FLOAT The incremental tab stop value.


%index
IDWriteTextFormat_GetTrimming
Gets the trimming options for text that overflows the layout box.
%group
COM misc / IDWriteTextFormat
%prm
this, trimmingOptions, trimmingSign
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
trimmingOptions : [var] Type: DWRITE_TRIMMING* When this method returns, it contains a pointer to a DWRITE_TRIMMING structure that holds the text trimming options for the overflowing text.
trimmingSign : [comobj] Type: IDWriteInlineObject** When this method returns, contains an address of a pointer to a trimming omission sign. This parameter may be NULL.
%inst
Gets the trimming options for text that overflows the layout box.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextFormat_GetLineSpacing
Gets the line spacing adjustment set for a multiline text paragraph. (IDWriteTextFormat.GetLineSpacing)
%group
COM misc / IDWriteTextFormat
%prm
this, lineSpacingMethod, lineSpacing, baseline
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
lineSpacingMethod : [var] Type: DWRITE_LINE_SPACING_METHOD* A value that indicates how line height is determined.
lineSpacing : [float] Type: FLOAT* When this method returns, contains the line height, or  distance between one baseline to another.
baseline : [float] Type: FLOAT* When this method returns, contains the distance from top of line to baseline. A reasonable ratio to lineSpacing is 80 percent.
%inst
Gets the line spacing adjustment set for a multiline text paragraph.
(IDWriteTextFormat.GetLineSpacing)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextFormat_GetFontCollection
Gets the current font collection.
%group
COM misc / IDWriteTextFormat
%prm
this, fontCollection
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
fontCollection : [comobj] Type: IDWriteFontCollection** When this method returns, contains an address of a pointer to the font collection being used for the current text.
%inst
Gets the current font collection.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextFormat_GetFontFamilyNameLength
Gets the length of the font family name.
%group
COM misc / IDWriteTextFormat
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
Gets the length of the font family name.

[戻り値]
Type: UINT32 The size of the character array, in character count, not
including the terminated NULL character.


%index
IDWriteTextFormat_GetFontFamilyName
Gets a copy of the font family name.
%group
COM misc / IDWriteTextFormat
%prm
this, fontFamilyName, nameSize
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
fontFamilyName : [wstr] Type: WCHAR* When this method returns, contains a pointer to a character array, which is null-terminated, that receives the current font family name. The buffer allocated for this array should be at least the size, in elements, of nameSize.
nameSize : [int] Type: UINT32 The size of the fontFamilyName character array, in character count, including the terminated NULL character.  To find the size of fontFamilyName, use GetFontFamilyNameLength.
%inst
Gets a copy of the font family name.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextFormat_GetFontWeight
Gets the font weight of the text.
%group
COM misc / IDWriteTextFormat
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
Gets the font weight of the text.

[戻り値]
Type: DWRITE_FONT_WEIGHT A value that indicates the type of weight
(such as normal, bold, or black).


%index
IDWriteTextFormat_GetFontStyle
Gets the font style of the text.
%group
COM misc / IDWriteTextFormat
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
Gets the font style of the text.

[戻り値]
Type: DWRITE_FONT_STYLE A value which indicates the type of font
style (such as slope or incline).


%index
IDWriteTextFormat_GetFontStretch
Gets the font stretch of the text.
%group
COM misc / IDWriteTextFormat
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
Gets the font stretch of the text.

[戻り値]
Type: DWRITE_FONT_STRETCH A value which indicates the type of font
stretch (such as normal or condensed).


%index
IDWriteTextFormat_GetFontSize
Gets the font size in DIP unites.
%group
COM misc / IDWriteTextFormat
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
Gets the font size in DIP unites.

[戻り値]
Type: FLOAT The current font size in DIP units.


%index
IDWriteTextFormat_GetLocaleNameLength
Gets the length of the locale name.
%group
COM misc / IDWriteTextFormat
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
Gets the length of the locale name.

[戻り値]
Type: UINT32 The size of the character array in character count, not
including the terminated NULL character.


%index
IDWriteTextFormat_GetLocaleName
Gets a copy of the locale name.
%group
COM misc / IDWriteTextFormat
%prm
this, localeName, nameSize
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
localeName : [wstr] Type: WCHAR* Contains a character array that receives the current locale name.
nameSize : [int] Type: UINT32 The size of the character array, in character count, including the terminated NULL character. Use GetLocaleNameLength to get the size of the locale name character array.
%inst
Gets a copy of the locale name.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_SetTextAlignment
IDWriteTextLayout::SetTextAlignment (vtable slot 3)
%group
COM misc / IDWriteTextLayout
%prm
this, textAlignment
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
textAlignment : [int] 
%inst


%index
IDWriteTextLayout_SetParagraphAlignment
IDWriteTextLayout::SetParagraphAlignment (vtable slot 4)
%group
COM misc / IDWriteTextLayout
%prm
this, paragraphAlignment
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
paragraphAlignment : [int] 
%inst


%index
IDWriteTextLayout_SetWordWrapping
IDWriteTextLayout::SetWordWrapping (vtable slot 5)
%group
COM misc / IDWriteTextLayout
%prm
this, wordWrapping
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
wordWrapping : [int] 
%inst


%index
IDWriteTextLayout_SetReadingDirection
IDWriteTextLayout::SetReadingDirection (vtable slot 6)
%group
COM misc / IDWriteTextLayout
%prm
this, readingDirection
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
readingDirection : [int] 
%inst


%index
IDWriteTextLayout_SetFlowDirection
IDWriteTextLayout::SetFlowDirection (vtable slot 7)
%group
COM misc / IDWriteTextLayout
%prm
this, flowDirection
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
flowDirection : [int] 
%inst


%index
IDWriteTextLayout_SetIncrementalTabStop
IDWriteTextLayout::SetIncrementalTabStop (vtable slot 8)
%group
COM misc / IDWriteTextLayout
%prm
this, incrementalTabStop
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
incrementalTabStop : [float] 
%inst


%index
IDWriteTextLayout_SetTrimming
IDWriteTextLayout::SetTrimming (vtable slot 9)
%group
COM misc / IDWriteTextLayout
%prm
this, trimmingOptions, trimmingSign
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
trimmingOptions : [var] 
trimmingSign : [comobj] 
%inst


%index
IDWriteTextLayout_SetLineSpacing
IDWriteTextLayout::SetLineSpacing (vtable slot 10)
%group
COM misc / IDWriteTextLayout
%prm
this, lineSpacingMethod, lineSpacing, baseline
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
lineSpacingMethod : [int] 
lineSpacing : [float] 
baseline : [float] 
%inst


%index
IDWriteTextLayout_GetTextAlignment
IDWriteTextLayout::GetTextAlignment (vtable slot 11)
%group
COM misc / IDWriteTextLayout
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst


%index
IDWriteTextLayout_GetParagraphAlignment
IDWriteTextLayout::GetParagraphAlignment (vtable slot 12)
%group
COM misc / IDWriteTextLayout
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst


%index
IDWriteTextLayout_GetWordWrapping
IDWriteTextLayout::GetWordWrapping (vtable slot 13)
%group
COM misc / IDWriteTextLayout
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst


%index
IDWriteTextLayout_GetReadingDirection
IDWriteTextLayout::GetReadingDirection (vtable slot 14)
%group
COM misc / IDWriteTextLayout
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst


%index
IDWriteTextLayout_GetFlowDirection
IDWriteTextLayout::GetFlowDirection (vtable slot 15)
%group
COM misc / IDWriteTextLayout
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst


%index
IDWriteTextLayout_GetIncrementalTabStop
IDWriteTextLayout::GetIncrementalTabStop (vtable slot 16)
%group
COM misc / IDWriteTextLayout
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst


%index
IDWriteTextLayout_GetTrimming
IDWriteTextLayout::GetTrimming (vtable slot 17)
%group
COM misc / IDWriteTextLayout
%prm
this, trimmingOptions, trimmingSign
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
trimmingOptions : [var] 
trimmingSign : [comobj] 
%inst


%index
IDWriteTextLayout_GetLineSpacing
IDWriteTextLayout::GetLineSpacing (vtable slot 18)
%group
COM misc / IDWriteTextLayout
%prm
this, lineSpacingMethod, lineSpacing, baseline
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
lineSpacingMethod : [var] 
lineSpacing : [float] 
baseline : [float] 
%inst


%index
IDWriteTextLayout_GetFontCollection
Gets the font collection associated with the text at the specified position.
%group
COM misc / IDWriteTextLayout
%prm
this, fontCollection
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
fontCollection : [comobj] Type: IDWriteFontCollection** Contains an address of a  pointer to the current font collection.
%inst
Gets the font collection associated with the text at the specified
position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetFontFamilyNameLength
Get the length of the font family name at the current position.
%group
COM misc / IDWriteTextLayout
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst
Get the length of the font family name at the current position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetFontFamilyName
Copies the font family name of the text at the specified position.
%group
COM misc / IDWriteTextLayout
%prm
this, fontFamilyName, nameSize
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
fontFamilyName : [wstr] Type: WCHAR* When this method returns, contains an array of characters that receives the current font family name. You must allocate storage for this parameter.
nameSize : [int] Type: UINT32 The size of the character array in character count including the terminated NULL character.
%inst
Copies the font family name of the text at the specified position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetFontWeight
Gets the font weight of the text at the specified position.
%group
COM misc / IDWriteTextLayout
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst
Gets the font weight of the text at the specified position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetFontStyle
Gets the font style (also known as slope) of the text at the specified position.
%group
COM misc / IDWriteTextLayout
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst
Gets the font style (also known as slope) of the text at the
specified position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetFontStretch
Gets the font stretch of the text at the specified position.
%group
COM misc / IDWriteTextLayout
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst
Gets the font stretch of the text at the specified position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetFontSize
Gets the font em height of the text at the specified position.
%group
COM misc / IDWriteTextLayout
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst
Gets the font em height of the text at the specified position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetLocaleNameLength
Gets the length of the locale name of the text at the specified position.
%group
COM misc / IDWriteTextLayout
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst
Gets the length of the locale name of the text at the specified
position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetLocaleName
Gets the locale name of the text at the specified position.
%group
COM misc / IDWriteTextLayout
%prm
this, localeName, nameSize
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
localeName : [wstr] Type: WCHAR* When this method returns, contains the character array receiving the current locale name.
nameSize : [int] Type: UINT32 Size of the character array, in character count, including the terminated NULL character.
%inst
Gets the locale name of the text at the specified position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_SetMaxWidth
Sets the layout maximum width.
%group
COM misc / IDWriteTextLayout
%prm
this, maxWidth
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
maxWidth : [float] Type: FLOAT A value that indicates the maximum width of the layout box.
%inst
Sets the layout maximum width.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_SetMaxHeight
Sets the layout maximum height.
%group
COM misc / IDWriteTextLayout
%prm
this, maxHeight
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
maxHeight : [float] Type: FLOAT A value that indicates the maximum height of the layout box.
%inst
Sets the layout maximum height.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_SetFontCollection
Sets the font collection.
%group
COM misc / IDWriteTextLayout
%prm
this, fontCollection, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
fontCollection : [comobj] Type: IDWriteFontCollection* The font collection to set.
textRange : [int] Type: DWRITE_TEXT_RANGE Text range to which this change applies.
%inst
Sets the font collection.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_SetFontFamilyName
Sets null-terminated font family name for text within a specified text range.
%group
COM misc / IDWriteTextLayout
%prm
this, fontFamilyName, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
fontFamilyName : [wstr] Type: const WCHAR* The font family name that applies to the entire text string within the range specified by textRange.
textRange : [int] Type: DWRITE_TEXT_RANGE Text range to which this change applies.
%inst
Sets null-terminated font family name for text within a specified
text range.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_SetFontWeight
Sets the font weight for text within a text range specified by a DWRITE_TEXT_RANGE structure.
%group
COM misc / IDWriteTextLayout
%prm
this, fontWeight, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
fontWeight : [int] Type: DWRITE_FONT_WEIGHT The font weight to be set for text within the range specified by textRange.
textRange : [int] Type: DWRITE_TEXT_RANGE Text range to which this change applies.
%inst
Sets the font weight for text within a text range specified by a
DWRITE_TEXT_RANGE structure.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The font weight can be set to one of the predefined font weight
values provided in the DWRITE_FONT_WEIGHT enumeration or an integer
from 1 to 999. Values outside this range will cause the method to
fail with an E_INVALIDARG return value. The following illustration
shows an example of Normal and UltraBold weights for the Palatino
Linotype typeface.
This doc was truncated.


%index
IDWriteTextLayout_SetFontStyle
Sets the font style for text within a text range specified by a DWRITE_TEXT_RANGE structure.
%group
COM misc / IDWriteTextLayout
%prm
this, fontStyle, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
fontStyle : [int] Type: DWRITE_FONT_STYLE The  font style to be set   for text within a range specified by textRange.
textRange : [int] Type: DWRITE_TEXT_RANGE The text range to which this change applies.
%inst
Sets the font style for text within a text range specified by a
DWRITE_TEXT_RANGE structure.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The font style can be set to Normal, Italic or Oblique. The following
illustration shows three styles for the Palatino font. For more
information, see DWRITE_FONT_STYLE.
This doc was truncated.


%index
IDWriteTextLayout_SetFontStretch
Sets the font stretch for text within a specified text range.
%group
COM misc / IDWriteTextLayout
%prm
this, fontStretch, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
fontStretch : [int] Type: DWRITE_FONT_STRETCH A value which indicates the type of font stretch for text within the range specified by textRange.
textRange : [int] Type: DWRITE_TEXT_RANGE Text range to which this change applies.
%inst
Sets the font stretch for text within a specified text range.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_SetFontSize
Sets the font size in DIP units for text within a specified text range.
%group
COM misc / IDWriteTextLayout
%prm
this, fontSize, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
fontSize : [float] Type: FLOAT The  font size in DIP units to be set for   text in the range specified by textRange.
textRange : [int] Type: DWRITE_TEXT_RANGE Text range to which this change applies.
%inst
Sets the font size in DIP units for text within a specified text
range.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_SetUnderline
Sets underlining for text within a specified text range.
%group
COM misc / IDWriteTextLayout
%prm
this, hasUnderline, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
hasUnderline : [int] Type: BOOL A Boolean flag that indicates whether underline takes place within a specified text range.
textRange : [int] Type: DWRITE_TEXT_RANGE Text range to which this change applies.
%inst
Sets underlining for text within a specified text range.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_SetStrikethrough
Sets strikethrough for text within a specified text range.
%group
COM misc / IDWriteTextLayout
%prm
this, hasStrikethrough, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
hasStrikethrough : [int] Type: BOOL A Boolean flag that indicates whether strikethrough takes place in the range specified by textRange.
textRange : [int] Type: DWRITE_TEXT_RANGE Text range to which this change applies.
%inst
Sets strikethrough for text within a specified text range.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_SetDrawingEffect
Sets the application-defined drawing effect.
%group
COM misc / IDWriteTextLayout
%prm
this, drawingEffect, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
drawingEffect : [int] Type: IUnknown* Application-defined drawing effects that apply to the range. This data object will be passed back to the application's drawing callbacks for final rendering.
textRange : [int] Type: DWRITE_TEXT_RANGE The text range to which this change applies.
%inst
Sets the application-defined drawing effect.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
An ID2D1Brush, such as a color or gradient brush, can be set as a
drawing effect if you are using the ID2D1RenderTarget::DrawTextLayout
to draw text and that brush will be used to draw the specified range
of text. This drawing effect is associated with the specified range
and will be passed back to the application by way of the callback
when the range is drawn at drawing time.


%index
IDWriteTextLayout_SetInlineObject
Sets the inline object.
%group
COM misc / IDWriteTextLayout
%prm
this, inlineObject, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
inlineObject : [comobj] Type: IDWriteInlineObject* An application-defined inline object.
textRange : [int] Type: DWRITE_TEXT_RANGE Text range to which this change applies.
%inst
Sets the inline object.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The application may call this function to specify the set of
properties describing an application-defined inline object for
specific range. This inline object applies to the specified range and
will be passed back to the application by way of the DrawInlineObject
callback when the range is drawn. Any text in that range will be
suppressed.


%index
IDWriteTextLayout_SetTypography
Sets font typography features for text within a specified text range.
%group
COM misc / IDWriteTextLayout
%prm
this, typography, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
typography : [comobj] Type: IDWriteTypography* Pointer to font typography settings.
textRange : [int] Type: DWRITE_TEXT_RANGE Text range to which this change applies.
%inst
Sets font typography features for text within a specified text range.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_SetLocaleName
Sets the locale name for text within a specified text range.
%group
COM misc / IDWriteTextLayout
%prm
this, localeName, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
localeName : [wstr] Type: const WCHAR* A null-terminated locale name string.
textRange : [int] Type: DWRITE_TEXT_RANGE Text range to which this change applies.
%inst
Sets the locale name for text within a specified text range.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetMaxWidth
Gets the layout maximum width.
%group
COM misc / IDWriteTextLayout
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst
Gets the layout maximum width.

[戻り値]
Type: FLOAT Returns the layout maximum width.


%index
IDWriteTextLayout_GetMaxHeight
Gets the layout maximum height.
%group
COM misc / IDWriteTextLayout
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst
Gets the layout maximum height.

[戻り値]
Type: FLOAT The layout maximum height.


%index
IDWriteTextLayout_GetFontCollection
Gets the font collection associated with the text at the specified position.
%group
COM misc / IDWriteTextLayout
%prm
this, currentPosition, fontCollection, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] Type: UINT32 The position of the text to inspect.
fontCollection : [comobj] Type: IDWriteFontCollection** Contains an address of a  pointer to the current font collection.
textRange : [var] Type: DWRITE_TEXT_RANGE* The range of text that has the same  formatting as the text at the position specified by currentPosition.  This means the run has the exact  formatting as the position specified, including but not limited to the underline.
%inst
Gets the font collection associated with the text at the specified
position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetFontFamilyNameLength
Get the length of the font family name at the current position.
%group
COM misc / IDWriteTextLayout
%prm
this, currentPosition, nameLength, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] Type: UINT32 The current text position.
nameLength : [int] Type: UINT32* When this method returns, contains the size of the character array containing the font family name, in character count, not including the terminated NULL character.
textRange : [var] Type: DWRITE_TEXT_RANGE* The range of text that has the same  formatting as the text at the position specified by currentPosition.  This means the run has the exact  formatting as the position specified, including but not limited to the font family.
%inst
Get the length of the font family name at the current position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetFontFamilyName
Copies the font family name of the text at the specified position.
%group
COM misc / IDWriteTextLayout
%prm
this, currentPosition, fontFamilyName, nameSize, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] Type: UINT32 The position of the text to examine.
fontFamilyName : [wstr] Type: WCHAR* When this method returns, contains an array of characters that receives the current font family name. You must allocate storage for this parameter.
nameSize : [int] Type: UINT32 The size of the character array in character count including the terminated NULL character.
textRange : [var] Type: DWRITE_TEXT_RANGE* The range of text that has the same  formatting as the text at the position specified by currentPosition.  This means the run has the exact  formatting as the position specified, including but not limited to the font family name.
%inst
Copies the font family name of the text at the specified position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetFontWeight
Gets the font weight of the text at the specified position.
%group
COM misc / IDWriteTextLayout
%prm
this, currentPosition, fontWeight, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] Type: UINT32 The position of the text to inspect.
fontWeight : [var] Type: DWRITE_FONT_WEIGHT* When this method returns, contains a value which indicates the type of font weight being applied at the specified position.
textRange : [var] Type: DWRITE_TEXT_RANGE* The range of text that has the same  formatting as the text at the position specified by currentPosition.  This means the run has the exact  formatting as the position specified, including but not limited to the font weight.
%inst
Gets the font weight of the text at the specified position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetFontStyle
Gets the font style (also known as slope) of the text at the specified position.
%group
COM misc / IDWriteTextLayout
%prm
this, currentPosition, fontStyle, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] Type: UINT32 The position of the text to inspect.
fontStyle : [var] Type: DWRITE_FONT_STYLE* When this method returns, contains a value which indicates the type of font style (also known as slope or incline) being applied at the specified position.
textRange : [var] Type: DWRITE_TEXT_RANGE* The range of text that has the same  formatting as the text at the position specified by currentPosition.  This means the run has the exact  formatting as the position specified, including but not limited to the font style.
%inst
Gets the font style (also known as slope) of the text at the
specified position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetFontStretch
Gets the font stretch of the text at the specified position.
%group
COM misc / IDWriteTextLayout
%prm
this, currentPosition, fontStretch, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] Type: UINT32 The position of the text to inspect.
fontStretch : [var] Type: DWRITE_FONT_STRETCH* When this method returns, contains a value which indicates the type of font stretch (also known as width) being applied at the specified position.
textRange : [var] Type: DWRITE_TEXT_RANGE* The range of text that has the same  formatting as the text at the position specified by currentPosition.  This means the run has the exact  formatting as the position specified, including but not limited to the font stretch.
%inst
Gets the font stretch of the text at the specified position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetFontSize
Gets the font em height of the text at the specified position.
%group
COM misc / IDWriteTextLayout
%prm
this, currentPosition, fontSize, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] Type: UINT32 The position of the text to inspect.
fontSize : [float] Type: FLOAT* When this method returns, contains the size of the font in ems  of the text at the specified position.
textRange : [var] Type: DWRITE_TEXT_RANGE* The range of text that has the same  formatting as the text at the position specified by currentPosition.  This means the run has the exact  formatting as the position specified, including but not limited to the font size.
%inst
Gets the font em height of the text at the specified position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetUnderline
Gets the underline presence of the text at the specified position.
%group
COM misc / IDWriteTextLayout
%prm
this, currentPosition, hasUnderline, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] Type: UINT32 The current text position.
hasUnderline : [var] Type: BOOL* A Boolean  flag that indicates whether underline is present at the position indicated by currentPosition.
textRange : [var] Type: DWRITE_TEXT_RANGE* The range of text that has the same  formatting as the text at the position specified by currentPosition.  This means the run has the exact  formatting as the position specified, including but not limited to the underline.
%inst
Gets the underline presence of the text at the specified position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetStrikethrough
Get the strikethrough presence of the text at the specified position.
%group
COM misc / IDWriteTextLayout
%prm
this, currentPosition, hasStrikethrough, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] Type: UINT32 The position of the text to inspect.
hasStrikethrough : [var] Type: BOOL* A Boolean  flag that indicates whether strikethrough is present at the position indicated by currentPosition.
textRange : [var] Type: DWRITE_TEXT_RANGE* Contains the range of text that has the same  formatting as the text at the position specified by currentPosition.  This means the run has the exact  formatting as the position specified, including but not limited to strikethrough.
%inst
Get the strikethrough presence of the text at the specified position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetDrawingEffect
Gets the application-defined drawing effect at the specified text position.
%group
COM misc / IDWriteTextLayout
%prm
this, currentPosition, drawingEffect, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] Type: UINT32 The position of the text whose drawing effect is to be retrieved.
drawingEffect : [int] Type: IUnknown** When this method returns, contains an address of a pointer to  the current application-defined drawing effect. Usually this effect is a foreground brush that  is used in glyph drawing.
textRange : [var] Type: DWRITE_TEXT_RANGE* Contains the range of text that has the same  formatting as the text at the position specified by currentPosition.  This means the run has the exact  formatting as the position specified, including but not limited to the drawing effect.
%inst
Gets the application-defined drawing effect at the specified text
position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetInlineObject
Gets the inline object at the specified position.
%group
COM misc / IDWriteTextLayout
%prm
this, currentPosition, inlineObject, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] Type: UINT32 The specified text position.
inlineObject : [comobj] Type: IDWriteInlineObject** Contains the application-defined inline object.
textRange : [var] Type: DWRITE_TEXT_RANGE* The range of text that has the same  formatting as the text at the position specified by currentPosition.  This means the run has the exact  formatting as the position specified, including but not limited to the inline object.
%inst
Gets the inline object at the specified position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetTypography
Gets the typography setting of the text at the specified position.
%group
COM misc / IDWriteTextLayout
%prm
this, currentPosition, typography, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] Type: UINT32 The position of the text to inspect.
typography : [comobj] Type: IDWriteTypography** When this method returns, contains an address of a  pointer to the current typography setting.
textRange : [var] Type: DWRITE_TEXT_RANGE* The range of text that has the same  formatting as the text at the position specified by currentPosition.  This means the run has the exact  formatting as the position specified, including but not limited to the typography.
%inst
Gets the typography setting of the text at the specified position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetLocaleNameLength
Gets the length of the locale name of the text at the specified position.
%group
COM misc / IDWriteTextLayout
%prm
this, currentPosition, nameLength, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] Type: UINT32 The position of the text to inspect.
nameLength : [int] Type: UINT32* Size of the character array, in character count, not including the terminated NULL character.
textRange : [var] Type: DWRITE_TEXT_RANGE* The range of text that has the same  formatting as the text at the position specified by currentPosition.  This means the run has the exact  formatting as the position specified, including but not limited to the locale name.
%inst
Gets the length of the locale name of the text at the specified
position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetLocaleName
Gets the locale name of the text at the specified position.
%group
COM misc / IDWriteTextLayout
%prm
this, currentPosition, localeName, nameSize, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] Type: UINT32 The position of the text to inspect.
localeName : [wstr] Type: WCHAR* When this method returns, contains the character array receiving the current locale name.
nameSize : [int] Type: UINT32 Size of the character array, in character count, including the terminated NULL character.
textRange : [var] Type: DWRITE_TEXT_RANGE* The range of text that has the same  formatting as the text at the position specified by currentPosition.  This means the run has the exact  formatting as the position specified, including but not limited to the locale name.
%inst
Gets the locale name of the text at the specified position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_Draw
Draws text using the specified client drawing context.
%group
COM misc / IDWriteTextLayout
%prm
this, clientDrawingContext, renderer, originX, originY
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] Type: void* An application-defined drawing context.
renderer : [comobj] Type: IDWriteTextRenderer* Pointer to the set of callback functions used to draw parts of a text string.
originX : [float] Type: FLOAT The x-coordinate of the layout's left side.
originY : [float] Type: FLOAT The y-coordinate of the layout's top side.
%inst
Draws text using the specified client drawing context.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
To draw text with this method, a textLayout object needs to be
created by the application using IDWriteFactory::CreateTextLayout.
After the textLayout object is obtained, the application calls the
IDWriteTextLayout::Draw method to draw the text, decorations, and
inline objects. The actual drawing is done through the callback
interface passed in as the textRenderer argument; there, the
corresponding DrawGlyphRun API is called. If you set a vertical text
reading direction on IDWriteTextLayout via SetReadingDirection with
DWRITE_READING_DIRECTION_TOP_TO_BOTTOM (or bottom to top), then you
must pass an interface that implements IDWriteTextRenderer1.
Otherwise you get the error DWRITE_E_TEXTRENDERERINCOMPATIBLE because
the original IDWriteTextRenderer interface only supported horizontal
text.


%index
IDWriteTextLayout_GetLineMetrics
Retrieves the information about each individual text line of the text string.
%group
COM misc / IDWriteTextLayout
%prm
this, lineMetrics, maxLineCount, actualLineCount
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
lineMetrics : [var] Type: DWRITE_LINE_METRICS* When this method returns, contains a pointer to an array of structures containing various calculated length values of individual text lines.
maxLineCount : [int] Type: UINT32 The maximum size of the lineMetrics array.
actualLineCount : [int] Type: UINT32* When this method returns, contains the actual size of the lineMetrics array that is needed.
%inst
Retrieves the information about each individual text line of the text
string.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
If maxLineCount is not large enough E_NOT_SUFFICIENT_BUFFER, which is
equivalent to HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER), is
returned and *actualLineCount is set to the number of lines needed.


%index
IDWriteTextLayout_GetMetrics
Retrieves overall metrics for the formatted string. (IDWriteTextLayout.GetMetrics)
%group
COM misc / IDWriteTextLayout
%prm
this, textMetrics
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
textMetrics : [var] Type: DWRITE_TEXT_METRICS* When this method returns, contains the measured distances of text and associated content after being formatted.
%inst
Retrieves overall metrics for the formatted string.
(IDWriteTextLayout.GetMetrics)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_GetOverhangMetrics
Returns the overhangs (in DIPs) of the layout and all objects contained in it, including text glyphs and inline objects.
%group
COM misc / IDWriteTextLayout
%prm
this, overhangs
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
overhangs : [var] Type: **[**DWRITE\_OVERHANG\_METRICS**](/windows/win32/api/dwrite/ns-dwrite-dwrite_overhang_metrics)\*** Overshoots of visible extents (in DIPs) outside the layout.
%inst
Returns the overhangs (in DIPs) of the layout and all objects
contained in it, including text glyphs and inline objects.

[戻り値]
Type: **HRESULT** If this method succeeds, it returns **S\_OK**.
Otherwise, it returns an **HRESULT** error code.

[備考]
Underlines and strikethroughs do not contribute to the black box
determination, since these are actually drawn by the renderer, which
is allowed to draw them in any variety of styles.


%index
IDWriteTextLayout_GetClusterMetrics
Retrieves logical properties and measurements of each glyph cluster.
%group
COM misc / IDWriteTextLayout
%prm
this, clusterMetrics, maxClusterCount, actualClusterCount
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
clusterMetrics : [var] Type: DWRITE_CLUSTER_METRICS* When this method returns, contains metrics, such as line-break or total advance width, for a glyph cluster.
maxClusterCount : [int] Type: UINT32 The maximum size of the clusterMetrics array.
actualClusterCount : [int] Type: UINT32* When this method returns, contains the actual size of the clusterMetrics array that is needed.
%inst
Retrieves logical properties and measurements of each glyph cluster.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
If maxClusterCount is not large enough, then E_NOT_SUFFICIENT_BUFFER,
which is equivalent to HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER),
is returned and actualClusterCount is set to the number of clusters
needed.


%index
IDWriteTextLayout_DetermineMinWidth
Determines the minimum possible width the layout can be set to without emergency breaking between the characters of whole words occurring.
%group
COM misc / IDWriteTextLayout
%prm
this, minWidth
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
minWidth : [float] Type: **FLOAT\*** Minimum width.
%inst
Determines the minimum possible width the layout can be set to
without emergency breaking between the characters of whole words
occurring.

[戻り値]
Type: **HRESULT** If this method succeeds, it returns **S\_OK**.
Otherwise, it returns an **HRESULT** error code.


%index
IDWriteTextLayout_HitTestPoint
The application calls this function passing in a specific pixel location relative to the top-left location of the layout box and obtains the information about the correspondent hit-test metrics of the text string where the hit-test has occurred.
%group
COM misc / IDWriteTextLayout
%prm
this, pointX, pointY, isTrailingHit, isInside, hitTestMetrics
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
pointX : [float] Type: FLOAT The pixel location X to hit-test, relative to the top-left location of the layout box.
pointY : [float] Type: FLOAT The pixel location Y to hit-test, relative to the top-left location of the layout box.
isTrailingHit : [var] Type: BOOL* An output flag that indicates whether the hit-test location is at the leading or the trailing side of the character. When the output *isInside value is set to FALSE, this value is set according to the output hitTestMetrics->textPosition value to represent the edge closest to the hit-test location.
isInside : [var] Type: BOOL* An output flag that indicates whether the hit-test location is inside the text string. When FALSE, the position nearest the text's edge is returned.
hitTestMetrics : [var] Type: DWRITE_HIT_TEST_METRICS* The output geometry fully enclosing the hit-test location. When the output *isInside value is set to FALSE, this structure represents the geometry enclosing the edge closest to the hit-test location.
%inst
The application calls this function passing in a specific pixel
location relative to the top-left location of the layout box and
obtains the information about the correspondent hit-test metrics of
the text string where the hit-test has occurred.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_HitTestTextPosition
The application calls this function to get the pixel location relative to the top-left of the layout box given the text position and the logical side of the position.
%group
COM misc / IDWriteTextLayout
%prm
this, textPosition, isTrailingHit, pointX, pointY, hitTestMetrics
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
textPosition : [int] Type: UINT32 The text position used to get the pixel location.
isTrailingHit : [int] Type: BOOL A Boolean flag that indicates whether the pixel location is of the leading or the trailing side of the specified text position.
pointX : [float] Type: FLOAT* When this method returns, contains the output pixel location X, relative to the top-left location of the layout box.
pointY : [float] Type: FLOAT* When this method returns, contains the output pixel location Y, relative to the top-left location of the layout box.
hitTestMetrics : [var] Type: DWRITE_HIT_TEST_METRICS* When this method returns, contains the output geometry fully enclosing the specified text position.
%inst
The application calls this function to get the pixel location
relative to the top-left of the layout box given the text position
and the logical side of the position.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextLayout_HitTestTextRange
The application calls this function to get a set of hit-test metrics corresponding to a range of text positions. One of the main usages is to implement highlight selection of the text string.
%group
COM misc / IDWriteTextLayout
%prm
this, textPosition, textLength, originX, originY, hitTestMetrics, maxHitTestMetricsCount, actualHitTestMetricsCount
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
textPosition : [int] Type: UINT32 The first text position of the specified range.
textLength : [int] Type: UINT32 The number of positions of the specified range.
originX : [float] Type: FLOAT The origin pixel location X at the left of the layout box. This offset is added to the hit-test metrics returned.
originY : [float] Type: FLOAT The origin pixel location Y at the top of the layout box. This offset is added to the hit-test metrics returned.
hitTestMetrics : [var] Type: DWRITE_HIT_TEST_METRICS* When this method returns, contains a pointer to a buffer of the output geometry fully enclosing the specified position range.  The buffer must be at least as large as maxHitTestMetricsCount.
maxHitTestMetricsCount : [int] Type: UINT32 Maximum number of boxes hitTestMetrics could hold in its buffer memory.
actualHitTestMetricsCount : [int] Type: UINT32* Actual number of geometries hitTestMetrics holds in its buffer memory.
%inst
The application calls this function to get a set of hit-test metrics
corresponding to a range of text positions. One of the main usages is
to implement highlight selection of the text string.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTextRenderer_IsPixelSnappingDisabled
IDWriteTextRenderer::IsPixelSnappingDisabled (vtable slot 3)
%group
COM misc / IDWriteTextRenderer
%prm
this, clientDrawingContext, isDisabled
this : [comobj] IDWriteTextRenderer インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] 
isDisabled : [var] 
%inst


%index
IDWriteTextRenderer_GetCurrentTransform
IDWriteTextRenderer::GetCurrentTransform (vtable slot 4)
%group
COM misc / IDWriteTextRenderer
%prm
this, clientDrawingContext, transform
this : [comobj] IDWriteTextRenderer インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] 
transform : [var] 
%inst


%index
IDWriteTextRenderer_GetPixelsPerDip
IDWriteTextRenderer::GetPixelsPerDip (vtable slot 5)
%group
COM misc / IDWriteTextRenderer
%prm
this, clientDrawingContext, pixelsPerDip
this : [comobj] IDWriteTextRenderer インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] 
pixelsPerDip : [float] 
%inst


%index
IDWriteTextRenderer_DrawGlyphRun
IDWriteTextLayout::Draw calls this function to instruct the client to render a run of glyphs. (IDWriteTextRenderer.DrawGlyphRun)
%group
COM misc / IDWriteTextRenderer
%prm
this, clientDrawingContext, baselineOriginX, baselineOriginY, measuringMode, glyphRun, glyphRunDescription, clientDrawingEffect
this : [comobj] IDWriteTextRenderer インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] Type: void* The application-defined drawing context passed to IDWriteTextLayout::Draw.
baselineOriginX : [float] Type: FLOAT The pixel location (X-coordinate) at the baseline origin of the glyph run.
baselineOriginY : [float] Type: FLOAT The pixel location (Y-coordinate) at the baseline origin of the glyph run.
measuringMode : [int] Type: DWRITE_MEASURING_MODE The measuring method for glyphs in the run, used with the other properties to determine the rendering mode.
glyphRun : [int] Type: const DWRITE_GLYPH_RUN* Pointer to the glyph run instance to render.
glyphRunDescription : [var] Type: const DWRITE_GLYPH_RUN_DESCRIPTION* A pointer to the glyph run description instance which contains properties of the characters associated with this run.
clientDrawingEffect : [int] Type: IUnknown* Application-defined drawing effects for the glyphs to render. Usually this argument represents effects such as the foreground brush filling the interior of text.
%inst
IDWriteTextLayout::Draw calls this function to instruct the client to
render a run of glyphs. (IDWriteTextRenderer.DrawGlyphRun)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The IDWriteTextLayout::Draw function calls this callback function
with all the information about glyphs to render. The application
implements this callback by mostly delegating the call to the
underlying platform's graphics API such as Direct2D to draw glyphs on
the drawing context. An application that uses GDI can implement this
callback in terms of the IDWriteBitmapRenderTarget::DrawGlyphRun
method.


%index
IDWriteTextRenderer_DrawUnderline
IDWriteTextLayout::Draw calls this function to instruct the client to draw an underline. (IDWriteTextRenderer.DrawUnderline)
%group
COM misc / IDWriteTextRenderer
%prm
this, clientDrawingContext, baselineOriginX, baselineOriginY, underline, clientDrawingEffect
this : [comobj] IDWriteTextRenderer インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] Type: void* The application-defined drawing context passed to IDWriteTextLayout::Draw.
baselineOriginX : [float] Type: FLOAT The pixel location (X-coordinate) at the baseline origin of the run where underline applies.
baselineOriginY : [float] Type: FLOAT The pixel location (Y-coordinate) at the baseline origin of the run where underline applies.
underline : [var] Type: const DWRITE_UNDERLINE* Pointer to  a structure containing underline logical information.
clientDrawingEffect : [int] Type: IUnknown* Application-defined effect to apply to the underline. Usually this argument represents effects such as the foreground brush filling the interior of a line.
%inst
IDWriteTextLayout::Draw calls this function to instruct the client to
draw an underline. (IDWriteTextRenderer.DrawUnderline)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
A single underline can be broken into multiple calls, depending on
how the formatting changes attributes. If font sizes/styles change
within an underline, the thickness and offset will be averaged
weighted according to characters. To get an appropriate starting
pixel position, add underline::offset to the baseline. Otherwise
there will be no spacing between the text. The x coordinate will
always be passed as the left side, regardless of text directionality.
This simplifies drawing and reduces the problem of round-off that
could potentially cause gaps or a double stamped alpha blend. To
avoid alpha overlap, round the end points to the nearest device
pixel.


%index
IDWriteTextRenderer_DrawStrikethrough
IDWriteTextLayout::Draw calls this function to instruct the client to draw a strikethrough. (IDWriteTextRenderer.DrawStrikethrough)
%group
COM misc / IDWriteTextRenderer
%prm
this, clientDrawingContext, baselineOriginX, baselineOriginY, strikethrough, clientDrawingEffect
this : [comobj] IDWriteTextRenderer インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] Type: void* The application-defined drawing context passed to IDWriteTextLayout::Draw.
baselineOriginX : [float] Type: FLOAT The pixel location (X-coordinate) at the baseline origin of the run where strikethrough applies.
baselineOriginY : [float] Type: FLOAT The pixel location (Y-coordinate) at the baseline origin of the run where strikethrough applies.
strikethrough : [var] Type: const DWRITE_STRIKETHROUGH* Pointer to  a structure containing strikethrough logical information.
clientDrawingEffect : [int] Type: IUnknown* Application-defined effect to apply to the strikethrough.  Usually this argument represents effects such as the foreground brush filling the interior of a line.
%inst
IDWriteTextLayout::Draw calls this function to instruct the client to
draw a strikethrough. (IDWriteTextRenderer.DrawStrikethrough)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
A single strikethrough can be broken into multiple calls, depending
on how the formatting changes attributes. Strikethrough is not
averaged across font sizes/styles changes. To get an appropriate
starting pixel position, add strikethrough::offset to the baseline.
Like underlines, the x coordinate will always be passed as the left
side, regardless of text directionality.


%index
IDWriteTextRenderer_DrawInlineObject
IDWriteTextLayout::Draw calls this application callback when it needs to draw an inline object. (IDWriteTextRenderer.DrawInlineObject)
%group
COM misc / IDWriteTextRenderer
%prm
this, clientDrawingContext, originX, originY, inlineObject, isSideways, isRightToLeft, clientDrawingEffect
this : [comobj] IDWriteTextRenderer インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] Type: void* The application-defined drawing context passed to IDWriteTextLayout::Draw.
originX : [float] Type: FLOAT X-coordinate at the top-left corner of the inline object.
originY : [float] Type: FLOAT Y-coordinate at the top-left corner of the inline object.
inlineObject : [comobj] Type: IDWriteInlineObject* The application-defined inline object set using IDWriteTextFormat::SetInlineObject.
isSideways : [int] Type: BOOL A Boolean flag that indicates whether the object's baseline runs alongside the baseline axis of the line.
isRightToLeft : [int] Type: BOOL A Boolean flag that indicates whether the object is in a right-to-left context, hinting that the drawing may want to mirror the normal image.
clientDrawingEffect : [int] Type: IUnknown* Application-defined drawing effects for the glyphs to render. Usually this argument represents effects such as the foreground brush filling the interior of a line.
%inst
IDWriteTextLayout::Draw calls this application callback when it needs
to draw an inline object. (IDWriteTextRenderer.DrawInlineObject)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTypography_AddFontFeature
Adds an OpenType font feature.
%group
COM misc / IDWriteTypography
%prm
this, fontFeature
this : [comobj] IDWriteTypography インターフェースの COM オブジェクト変数
fontFeature : [int] Type: DWRITE_FONT_FEATURE A structure that contains the OpenType name identifier and the execution parameter for the font feature being added.
%inst
Adds an OpenType font feature.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IDWriteTypography_GetFontFeatureCount
Gets the number of OpenType font features for the current font.
%group
COM misc / IDWriteTypography
%prm
this
this : [comobj] IDWriteTypography インターフェースの COM オブジェクト変数
%inst
Gets the number of OpenType font features for the current font.

[戻り値]
Type: UINT32 The number of font features for the current text format.

[備考]
A single run of text can be associated with more than one typographic
feature. The IDWriteTypography object holds a list of these font
features.


%index
IDWriteTypography_GetFontFeature
Gets the font feature at the specified index.
%group
COM misc / IDWriteTypography
%prm
this, fontFeatureIndex, fontFeature
this : [comobj] IDWriteTypography インターフェースの COM オブジェクト変数
fontFeatureIndex : [int] Type: UINT32 The zero-based index of the font feature to retrieve.
fontFeature : [var] Type: DWRITE_FONT_FEATURE* When this method returns, contains the font feature which is at the specified index.
%inst
Gets the font feature at the specified index.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
A single run of text can be associated with more than one typographic
feature. The IDWriteTypography object holds a list of these font
features.


%index
IDXGIAdapter_SetPrivateData
IDXGIAdapter::SetPrivateData (vtable slot 3)
%group
COM misc / IDXGIAdapter
%prm
this, Name, DataSize, pData
this : [comobj] IDXGIAdapter インターフェースの COM オブジェクト変数
Name : [var] 
DataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGIAdapter_SetPrivateDataInterface
IDXGIAdapter::SetPrivateDataInterface (vtable slot 4)
%group
COM misc / IDXGIAdapter
%prm
this, Name, pUnknown
this : [comobj] IDXGIAdapter インターフェースの COM オブジェクト変数
Name : [var] 
pUnknown : [int] 
%inst


%index
IDXGIAdapter_GetPrivateData
IDXGIAdapter::GetPrivateData (vtable slot 5)
%group
COM misc / IDXGIAdapter
%prm
this, Name, pDataSize, pData
this : [comobj] IDXGIAdapter インターフェースの COM オブジェクト変数
Name : [var] 
pDataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGIAdapter_GetParent
IDXGIAdapter::GetParent (vtable slot 6)
%group
COM misc / IDXGIAdapter
%prm
this, riid, ppParent
this : [comobj] IDXGIAdapter インターフェースの COM オブジェクト変数
riid : [var] 
ppParent : [int] 
%inst


%index
IDXGIAdapter_EnumOutputs
Enumerate adapter (video card) outputs.
%group
COM misc / IDXGIAdapter
%prm
this, Output, ppOutput
this : [comobj] IDXGIAdapter インターフェースの COM オブジェクト変数
Output : [int] Type: UINT The index of the output.
ppOutput : [comobj] Type: IDXGIOutput** The address of a pointer to an IDXGIOutput interface at the position specified by the Output parameter.
%inst
Enumerate adapter (video card) outputs.

[戻り値]
Type: HRESULT A code that indicates success or failure (see
DXGI_ERROR). DXGI_ERROR_NOT_FOUND is returned if the index is greater
than the number of outputs. If the adapter came from a device created
using D3D_DRIVER_TYPE_WARP, then the adapter has no outputs, so
DXGI_ERROR_NOT_FOUND is returned.

[備考]
Note If you call this API in a Session 0 process, it returns
DXGI_ERROR_NOT_CURRENTLY_AVAILABLE. When the EnumOutputs method
succeeds and fills the ppOutput parameter with the address of the
pointer to the output interface, EnumOutputs increments the output
interface's reference count. To avoid a memory leak, when you finish
using the output interface, call the Release method to decrement the
reference count. EnumOutputs first returns the output on which the
desktop primary is displayed. This output corresponds with an index
of zero. EnumOutputs then returns other outputs.


%index
IDXGIAdapter_GetDesc
Gets a DXGI 1.0 description of an adapter (or video card).
%group
COM misc / IDXGIAdapter
%prm
this
this : [comobj] IDXGIAdapter インターフェースの COM オブジェクト変数
%inst
Gets a DXGI 1.0 description of an adapter (or video card).

[戻り値]
Type: HRESULT Returns S_OK if successful; otherwise returns
E_INVALIDARG if the pDesc parameter is NULL.

[備考]
Graphics apps can use the DXGI API to retrieve an accurate set of
graphics memory values on systems that have Windows Display Driver
Model (WDDM) drivers. The following are the critical steps involved.
This doc was truncated.


%index
IDXGIAdapter_CheckInterfaceSupport
Checks whether the system supports a device interface for a graphics component.
%group
COM misc / IDXGIAdapter
%prm
this, InterfaceName, pUMDVersion
this : [comobj] IDXGIAdapter インターフェースの COM オブジェクト変数
InterfaceName : [var] Type: REFGUID The GUID of the interface of the device version for which support is being checked. This should usually be __uuidof(IDXGIDevice), which returns the version number of the Direct3D 9 UMD (user mode driver) binary. Since WDDM 2.3, all driver components within a driver package (D3D9, D3D11, and D3D12) have been required to share a single version number, so this is a good way to query the driver version regardless of which API is being used.
pUMDVersion : [int64] Type: LARGE_INTEGER* The user mode driver version of InterfaceName. This is  returned only if the interface is supported, otherwise this parameter will be NULL.
%inst
Checks whether the system supports a device interface for a graphics
component.

[戻り値]
Type: HRESULT S_OK indicates that the interface is supported,
otherwise DXGI_ERROR_UNSUPPORTED is returned (For more information,
see DXGI_ERROR).

[備考]
Note You can use CheckInterfaceSupport only to check whether a
Direct3D 10.x interface is supported, and only on Windows Vista SP1
and later versions of the operating system. If you try to use
CheckInterfaceSupport to check whether a Direct3D 11.x and later
version interface is supported, CheckInterfaceSupport returns
DXGI_ERROR_UNSUPPORTED. Therefore, do not use CheckInterfaceSupport.
Instead, to verify whether the operating system supports a particular
interface, try to create the interface. For example, if you call the
ID3D11Device::CreateBlendState method and it fails, the operating
system does not support the ID3D11BlendState interface.


%index
IDXGIDevice_SetPrivateData
IDXGIDevice::SetPrivateData (vtable slot 3)
%group
COM misc / IDXGIDevice
%prm
this, Name, DataSize, pData
this : [comobj] IDXGIDevice インターフェースの COM オブジェクト変数
Name : [var] 
DataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGIDevice_SetPrivateDataInterface
IDXGIDevice::SetPrivateDataInterface (vtable slot 4)
%group
COM misc / IDXGIDevice
%prm
this, Name, pUnknown
this : [comobj] IDXGIDevice インターフェースの COM オブジェクト変数
Name : [var] 
pUnknown : [int] 
%inst


%index
IDXGIDevice_GetPrivateData
IDXGIDevice::GetPrivateData (vtable slot 5)
%group
COM misc / IDXGIDevice
%prm
this, Name, pDataSize, pData
this : [comobj] IDXGIDevice インターフェースの COM オブジェクト変数
Name : [var] 
pDataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGIDevice_GetParent
IDXGIDevice::GetParent (vtable slot 6)
%group
COM misc / IDXGIDevice
%prm
this, riid, ppParent
this : [comobj] IDXGIDevice インターフェースの COM オブジェクト変数
riid : [var] 
ppParent : [int] 
%inst


%index
IDXGIDevice_GetAdapter
Returns the adapter for the specified device.
%group
COM misc / IDXGIDevice
%prm
this, pAdapter
this : [comobj] IDXGIDevice インターフェースの COM オブジェクト変数
pAdapter : [comobj] Type: IDXGIAdapter** The address of an IDXGIAdapter interface pointer to the adapter.  This parameter must not be NULL.
%inst
Returns the adapter for the specified device.

[戻り値]
Type: HRESULT Returns S_OK if successful; otherwise, returns one of
the DXGI_ERROR that indicates failure. If the pAdapter parameter is
NULL this method returns E_INVALIDARG.

[備考]
If the GetAdapter method succeeds, the reference count on the adapter
interface will be incremented. To avoid a memory leak, be sure to
release the interface when you are finished using it.


%index
IDXGIDevice_CreateSurface
Returns a surface. This method is used internally and you should not call it directly in your application.
%group
COM misc / IDXGIDevice
%prm
this, pDesc, NumSurfaces, Usage, pSharedResource, ppSurface
this : [comobj] IDXGIDevice インターフェースの COM オブジェクト変数
pDesc : [var] Type: const DXGI_SURFACE_DESC* A pointer to a DXGI_SURFACE_DESC structure that describes the surface.
NumSurfaces : [int] Type: UINT The number of surfaces to create.
Usage : [int] Type: DXGI_USAGE A DXGI_USAGE flag that specifies how the surface is expected to be used.
pSharedResource : [var] Type: const DXGI_SHARED_RESOURCE* An optional pointer to a DXGI_SHARED_RESOURCE structure that contains shared resource information for opening views of such resources.
ppSurface : [comobj] Type: IDXGISurface** The address of an IDXGISurface interface pointer to the first created surface.
%inst
Returns a surface. This method is used internally and you should not
call it directly in your application.

[戻り値]
Type: HRESULT Returns S_OK if successful; an error code otherwise.
For a list of error codes, see DXGI_ERROR.

[備考]
The CreateSurface method creates a buffer to exchange data between
one or more devices. It is used internally, and you should not
directly call it. The runtime automatically creates an IDXGISurface
interface when it creates a Direct3D resource object that represents
a surface. For example, the runtime creates an IDXGISurface interface
when it calls ID3D11Device::CreateTexture2D or
ID3D10Device::CreateTexture2D to create a 2D texture. To retrieve the
IDXGISurface interface that represents the 2D texture surface, call
ID3D11Texture2D::QueryInterface or ID3D10Texture2D::QueryInterface.
In this call, you must pass the identifier of IDXGISurface. If the 2D
texture has only a single MIP-map level and does not consist of an
array of textures, QueryInterface succeeds and returns a pointer to
the IDXGISurface interface pointer. Otherwise, QueryInterface fails
and does not return the pointer to IDXGISurface.


%index
IDXGIDevice_QueryResourceResidency
Gets the residency status of an array of resources.
%group
COM misc / IDXGIDevice
%prm
this, ppResources, pResidencyStatus, NumResources
this : [comobj] IDXGIDevice インターフェースの COM オブジェクト変数
ppResources : [int] Type: IUnknown* An array of IDXGIResource interfaces.
pResidencyStatus : [var] Type: DXGI_RESIDENCY* An array of DXGI_RESIDENCY flags. Each element describes the residency status for corresponding element in the ppResources argument array.
NumResources : [int] Type: UINT The number of resources in the ppResources argument array and pResidencyStatus argument array.
%inst
Gets the residency status of an array of resources.

[戻り値]
Type: HRESULT Returns S_OK if successful; otherwise, returns
DXGI_ERROR_DEVICE_REMOVED, E_INVALIDARG, or E_POINTER (see Common
HRESULT Values and WinError.h for more information).

[備考]
The information returned by the pResidencyStatus argument array
describes the residency status at the time that the
QueryResourceResidency method was called.
Note The residency status will constantly change. If you call the
QueryResourceResidency method during a device removed state, the
pResidencyStatus argument will return the
DXGI_RESIDENCY_RESIDENT_IN_SHARED_MEMORY flag. Note This method
should not be called every frame as it incurs a non-trivial amount of
overhead.


%index
IDXGIDevice_SetGPUThreadPriority
Sets the GPU thread priority.
%group
COM misc / IDXGIDevice
%prm
this, Priority
this : [comobj] IDXGIDevice インターフェースの COM オブジェクト変数
Priority : [int] Type: INT A value that specifies the required GPU thread priority. This value must be between -7 and 7, inclusive, where 0 represents normal priority.
%inst
Sets the GPU thread priority.

[戻り値]
Type: HRESULT Return S_OK if successful; otherwise, returns
E_INVALIDARG if the Priority parameter is invalid.

[備考]
The values for the Priority parameter function as follows:
This doc was truncated.


%index
IDXGIDevice_GetGPUThreadPriority
Gets the GPU thread priority.
%group
COM misc / IDXGIDevice
%prm
this, pPriority
this : [comobj] IDXGIDevice インターフェースの COM オブジェクト変数
pPriority : [int] Type: INT* A pointer to a variable that receives a value that indicates the current GPU thread priority. The value will be between -7 and 7, inclusive, where 0 represents normal priority.
%inst
Gets the GPU thread priority.

[戻り値]
Type: HRESULT Return S_OK if successful; otherwise, returns E_POINTER
if the pPriority parameter is NULL.


%index
IDXGIDeviceSubObject_SetPrivateData
IDXGIDeviceSubObject::SetPrivateData (vtable slot 3)
%group
COM misc / IDXGIDeviceSubObject
%prm
this, Name, DataSize, pData
this : [comobj] IDXGIDeviceSubObject インターフェースの COM オブジェクト変数
Name : [var] 
DataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGIDeviceSubObject_SetPrivateDataInterface
IDXGIDeviceSubObject::SetPrivateDataInterface (vtable slot 4)
%group
COM misc / IDXGIDeviceSubObject
%prm
this, Name, pUnknown
this : [comobj] IDXGIDeviceSubObject インターフェースの COM オブジェクト変数
Name : [var] 
pUnknown : [int] 
%inst


%index
IDXGIDeviceSubObject_GetPrivateData
IDXGIDeviceSubObject::GetPrivateData (vtable slot 5)
%group
COM misc / IDXGIDeviceSubObject
%prm
this, Name, pDataSize, pData
this : [comobj] IDXGIDeviceSubObject インターフェースの COM オブジェクト変数
Name : [var] 
pDataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGIDeviceSubObject_GetParent
IDXGIDeviceSubObject::GetParent (vtable slot 6)
%group
COM misc / IDXGIDeviceSubObject
%prm
this, riid, ppParent
this : [comobj] IDXGIDeviceSubObject インターフェースの COM オブジェクト変数
riid : [var] 
ppParent : [int] 
%inst


%index
IDXGIDeviceSubObject_GetDevice
Retrieves the device.
%group
COM misc / IDXGIDeviceSubObject
%prm
this, riid, ppDevice
this : [comobj] IDXGIDeviceSubObject インターフェースの COM オブジェクト変数
riid : [var] Type: REFIID The reference id for the device.
ppDevice : [int] Type: void** The address of a pointer to the device.
%inst
Retrieves the device.

[戻り値]
Type: HRESULT A code that indicates success or failure (see
DXGI_ERROR).

[備考]
The type of interface that is returned can be any interface published
by the device. For example, it could be an IDXGIDevice * called
pDevice, and therefore the REFIID would be obtained by calling
__uuidof(pDevice).


%index
IDXGIFactory_SetPrivateData
IDXGIFactory::SetPrivateData (vtable slot 3)
%group
COM misc / IDXGIFactory
%prm
this, Name, DataSize, pData
this : [comobj] IDXGIFactory インターフェースの COM オブジェクト変数
Name : [var] 
DataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGIFactory_SetPrivateDataInterface
IDXGIFactory::SetPrivateDataInterface (vtable slot 4)
%group
COM misc / IDXGIFactory
%prm
this, Name, pUnknown
this : [comobj] IDXGIFactory インターフェースの COM オブジェクト変数
Name : [var] 
pUnknown : [int] 
%inst


%index
IDXGIFactory_GetPrivateData
IDXGIFactory::GetPrivateData (vtable slot 5)
%group
COM misc / IDXGIFactory
%prm
this, Name, pDataSize, pData
this : [comobj] IDXGIFactory インターフェースの COM オブジェクト変数
Name : [var] 
pDataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGIFactory_GetParent
IDXGIFactory::GetParent (vtable slot 6)
%group
COM misc / IDXGIFactory
%prm
this, riid, ppParent
this : [comobj] IDXGIFactory インターフェースの COM オブジェクト変数
riid : [var] 
ppParent : [int] 
%inst


%index
IDXGIFactory_EnumAdapters
Enumerates the adapters (video cards).
%group
COM misc / IDXGIFactory
%prm
this, Adapter, ppAdapter
this : [comobj] IDXGIFactory インターフェースの COM オブジェクト変数
Adapter : [int] Type: UINT The index of the adapter to enumerate.
ppAdapter : [comobj] Type: IDXGIAdapter** The address of a pointer to an IDXGIAdapter interface at the position specified by the Adapter parameter.  This parameter must not be NULL.
%inst
Enumerates the adapters (video cards).

[戻り値]
Type: HRESULT Returns S_OK if successful; otherwise, returns
DXGI_ERROR_NOT_FOUND if the index is greater than or equal to the
number of adapters in the local system, or DXGI_ERROR_INVALID_CALL if
ppAdapter parameter is NULL.

[備考]
When you create a factory, the factory enumerates the set of adapters
that are available in the system. Therefore, if you change the
adapters in a system, you must destroy and recreate the IDXGIFactory
object. The number of adapters in a system changes when you add or
remove a display card, or dock or undock a laptop. When the
EnumAdapters method succeeds and fills the ppAdapter parameter with
the address of the pointer to the adapter interface, EnumAdapters
increments the adapter interface's reference count. When you finish
using the adapter interface, call the Release method to decrement the
reference count before you destroy the pointer. EnumAdapters first
returns the adapter with the output on which the desktop primary is
displayed. This adapter corresponds with an index of zero.
EnumAdapters next returns other adapters with outputs. EnumAdapters
finally returns adapters without outputs.


%index
IDXGIFactory_MakeWindowAssociation
Allows DXGI to monitor an application's message queue for the alt-enter key sequence (which causes the application to switch from windowed to full screen or vice versa).
%group
COM misc / IDXGIFactory
%prm
this, WindowHandle, Flags
this : [comobj] IDXGIFactory インターフェースの COM オブジェクト変数
WindowHandle : [intptr] Type: HWND The handle of the window that is to be monitored. This parameter can be NULL; but only if *Flags* is also 0.
Flags : [int] Type: UINT
%inst
Allows DXGI to monitor an application's message queue for the
alt-enter key sequence (which causes the application to switch from
windowed to full screen or vice versa).

[戻り値]
Type: HRESULT DXGI_ERROR_INVALID_CALL if WindowHandle is invalid, or
E_OUTOFMEMORY.

[備考]
Note If you call this API in a Session 0 process, it returns
DXGI_ERROR_NOT_CURRENTLY_AVAILABLE. The combination of WindowHandle
and Flags informs DXGI to stop monitoring window messages for the
previously-associated window. If the application switches to
full-screen mode, DXGI will choose a full-screen resolution to be the
smallest supported resolution that is larger or the same size as the
current back buffer size. Applications can make some changes to make
the transition from windowed to full screen more efficient. For
example, on a WM_SIZE message, the application should release any
outstanding swap-chain back buffers, call
IDXGISwapChain::ResizeBuffers, then re-acquire the back buffers from
the swap chain(s). This gives the swap chain(s) an opportunity to
resize the back buffers, and/or recreate them to enable full-screen
flipping operation. If the application does not perform this
sequence, DXGI will still make the full-screen/windowed transition,
but may be forced to use a stretch operation (since the back buffers
may not be the correct size), which may be less efficient. Even if a
stretch is not required, presentation may not be optimal because the
back buffers might not be directly interchangeable with the front
buffer. Thus, a call to ResizeBuffers on WM_SIZE is always
recommended, since WM_SIZE is always sent during a fullscreen
transition. While windowed, the application can, if it chooses,
restrict the size of its window's client area to sizes to which it is
comfortable rendering. A fully flexible application would make no
such restriction, but UI elements or other design considerations can,
of course, make this flexibility untenable. If the application
further chooses to restrict its window's client area to just those
that match supported full-screen resolutions, the application can
field WM_SIZING, then check against
IDXGIOutput::FindClosestMatchingMode. If a matching mode is found,
allow the resize. (The IDXGIOutput can be retrieved from
IDXGISwapChain::GetContainingOutput. Absent subsequent changes to
desktop topology, this will be the same output that will be chosen
when alt-enter is fielded and fullscreen mode is begun for that swap
chain.) Applications that want to handle mode changes or Alt+Enter
themselves should call MakeWindowAssociation with the
DXGI_MWA_NO_WINDOW_CHANGES flag after swap chain creation. The
WindowHandle argument, if non-NULL, specifies that the application
message queues will not be handled by the DXGI runtime for all swap
chains of a particular target HWND. Calling MakeWindowAssociation
with the DXGI_MWA_NO_WINDOW_CHANGES flag after swapchain creation
ensures that DXGI will not interfere with application's handling of
window mode changes or Alt+Enter. You must call the
**MakeWindowAssociation** method on the factory object associated
with the target HWND swap chain(s). You can guarantee that by calling
the
[IDXGIObject::GetParent](/windows/win32/api/dxgi/nf-dxgi-idxgiobject-getparent)
method on the swap chain(s) to locate the factory. Here's a code
example of doing that.
This doc was truncated.


%index
IDXGIFactory_GetWindowAssociation
Get the window through which the user controls the transition to and from full screen.
%group
COM misc / IDXGIFactory
%prm
this, pWindowHandle
this : [comobj] IDXGIFactory インターフェースの COM オブジェクト変数
pWindowHandle : [var] Type: HWND* A pointer to a window handle.
%inst
Get the window through which the user controls the transition to and
from full screen.

[戻り値]
Type: HRESULT Returns a code that indicates success or failure. S_OK
indicates success, DXGI_ERROR_INVALID_CALL indicates pWindowHandle
was passed in as NULL.

[備考]
Note If you call this API in a Session 0 process, it returns
DXGI_ERROR_NOT_CURRENTLY_AVAILABLE.


%index
IDXGIFactory_CreateSwapChain
Creates a swap chain.
%group
COM misc / IDXGIFactory
%prm
this, pDevice, pDesc, ppSwapChain
this : [comobj] IDXGIFactory インターフェースの COM オブジェクト変数
pDevice : [int] Type: IUnknown* For Direct3D 11, and earlier versions of Direct3D, this is a pointer to the Direct3D device for the swap chain. For Direct3D 12 this is a pointer to a direct command queue (refer to ID3D12CommandQueue) . This parameter cannot be NULL.
pDesc : [var] Type: DXGI_SWAP_CHAIN_DESC* A pointer to a  DXGI_SWAP_CHAIN_DESC structure for the swap-chain description. This parameter cannot be NULL.
ppSwapChain : [comobj] Type: IDXGISwapChain** A pointer to a variable that receives a pointer to the IDXGISwapChain interface for the swap chain that CreateSwapChain creates.
%inst
Creates a swap chain.

[戻り値]
Type: HRESULT
DXGI_ERROR_INVALID_CALL if pDesc or ppSwapChain is NULL,
DXGI_STATUS_OCCLUDED if you request full-screen mode and it is
unavailable, or E_OUTOFMEMORY. Other error codes defined by the type
of device passed in may also be returned.

[備考]
Note If you call this API in a Session 0 process, it returns
DXGI_ERROR_NOT_CURRENTLY_AVAILABLE. If you attempt to create a swap
chain in full-screen mode, and full-screen mode is unavailable, the
swap chain will be created in windowed mode and DXGI_STATUS_OCCLUDED
will be returned. If the buffer width or the buffer height is zero,
the sizes will be inferred from the output window size in the
swap-chain description. Because the target output can't be chosen
explicitly when the swap chain is created, we recommend not to create
a full-screen swap chain. This can reduce presentation performance if
the swap chain size and the output window size do not match. Here are
two ways to ensure that the sizes match:
This doc was truncated.


%index
IDXGIFactory_CreateSoftwareAdapter
Create an adapter interface that represents a software adapter.
%group
COM misc / IDXGIFactory
%prm
this, Module, ppAdapter
this : [comobj] IDXGIFactory インターフェースの COM オブジェクト変数
Module : [intptr] Type: HMODULE Handle to the software adapter's dll. HMODULE can be obtained with GetModuleHandle or LoadLibrary.
ppAdapter : [comobj] Type: IDXGIAdapter** Address of a pointer to an adapter (see IDXGIAdapter).
%inst
Create an adapter interface that represents a software adapter.

[戻り値]
Type: HRESULT A return code indicating success or failure.

[備考]
A software adapter is a DLL that implements the entirety of a device
driver interface, plus emulation, if necessary, of kernel-mode
graphics components for Windows. Details on implementing a software
adapter can be found in the Windows Vista Driver Development Kit.
This is a very complex development task, and is not recommended for
general readers. Calling this method will increment the module's
reference count by one. The reference count can be decremented by
calling FreeLibrary. The typical calling scenario is to call
LoadLibrary, pass the handle to CreateSoftwareAdapter, then
immediately call FreeLibrary on the DLL and forget the DLL's HMODULE.
Since the software adapter calls FreeLibrary when it is destroyed,
the lifetime of the DLL will now be owned by the adapter, and the
application is free of any further consideration of its lifetime.


%index
IDXGIObject_SetPrivateData
Sets application-defined data to the object and associates that data with a GUID.
%group
COM misc / IDXGIObject
%prm
this, Name, DataSize, pData
this : [comobj] IDXGIObject インターフェースの COM オブジェクト変数
Name : [var] Type: REFGUID A GUID that identifies the data. Use this GUID in a call to GetPrivateData to get the data.
DataSize : [int] Type: UINT The size of the object's data.
pData : [intptr] Type: const void* A pointer to the object's data.
%inst
Sets application-defined data to the object and associates that data
with a GUID.

[戻り値]
Type: HRESULT Returns one of the DXGI_ERROR values.

[備考]
SetPrivateData makes a copy of the specified data and stores it with
the object. Private data that SetPrivateData stores in the object
occupies the same storage space as private data that is stored by
associated Direct3D objects (for example, by a Microsoft Direct3D 11
device through ID3D11Device::SetPrivateData or by a Direct3D 11 child
device through ID3D11DeviceChild::SetPrivateData). The debug layer
reports memory leaks by outputting a list of object interface
pointers along with their friendly names. The default friendly name
is "<unnamed>". You can set the friendly name so that you can
determine if the corresponding object interface pointer caused the
leak. To set the friendly name, use the SetPrivateData method and the
well-known private data GUID (WKPDID_D3DDebugObjectName) that is in
D3Dcommon.h. For example, to give pContext a friendly name of My
name, use the following code:
This doc was truncated.


%index
IDXGIObject_SetPrivateDataInterface
Set an interface in the object's private data.
%group
COM misc / IDXGIObject
%prm
this, Name, pUnknown
this : [comobj] IDXGIObject インターフェースの COM オブジェクト変数
Name : [var] Type: REFGUID A GUID identifying the interface.
pUnknown : [int] Type: const IUnknown* The interface to set.
%inst
Set an interface in the object's private data.

[戻り値]
Type: HRESULT Returns one of the following DXGI_ERROR.

[備考]
This API associates an interface pointer with the object. When the
interface is set its reference count is incremented. When the data
are overwritten (by calling SPD or SPDI with the same GUID) or the
object is destroyed, ::Release() is called and the interface's
reference count is decremented.


%index
IDXGIObject_GetPrivateData
Get a pointer to the object's data.
%group
COM misc / IDXGIObject
%prm
this, Name, pDataSize, pData
this : [comobj] IDXGIObject インターフェースの COM オブジェクト変数
Name : [var] Type: REFGUID A GUID identifying the data.
pDataSize : [int] Type: UINT* The size of the data.
pData : [intptr] Type: void* Pointer to the data.
%inst
Get a pointer to the object's data.

[戻り値]
Type: HRESULT Returns one of the following DXGI_ERROR.

[備考]
If the data returned is a pointer to an IUnknown, or one of its
derivative classes, previously set by
IDXGIObject::SetPrivateDataInterface, you must call ::Release() on
the pointer before the pointer is freed to decrement the reference
count. You can pass GUID_DeviceType in the Name parameter of
GetPrivateData to retrieve the device type from the display adapter
object (IDXGIAdapter, IDXGIAdapter1, IDXGIAdapter2). To get the type
of device on which the display adapter was created
This doc was truncated.


%index
IDXGIObject_GetParent
Gets the parent of the object.
%group
COM misc / IDXGIObject
%prm
this, riid, ppParent
this : [comobj] IDXGIObject インターフェースの COM オブジェクト変数
riid : [var] Type: REFIID The ID of the requested interface.
ppParent : [int] Type: void** The address of a pointer to the parent object.
%inst
Gets the parent of the object.

[戻り値]
Type: HRESULT Returns one of the DXGI_ERROR values.


%index
IDXGIOutput_SetPrivateData
IDXGIOutput::SetPrivateData (vtable slot 3)
%group
COM misc / IDXGIOutput
%prm
this, Name, DataSize, pData
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
Name : [var] 
DataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGIOutput_SetPrivateDataInterface
IDXGIOutput::SetPrivateDataInterface (vtable slot 4)
%group
COM misc / IDXGIOutput
%prm
this, Name, pUnknown
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
Name : [var] 
pUnknown : [int] 
%inst


%index
IDXGIOutput_GetPrivateData
IDXGIOutput::GetPrivateData (vtable slot 5)
%group
COM misc / IDXGIOutput
%prm
this, Name, pDataSize, pData
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
Name : [var] 
pDataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGIOutput_GetParent
IDXGIOutput::GetParent (vtable slot 6)
%group
COM misc / IDXGIOutput
%prm
this, riid, ppParent
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
riid : [var] 
ppParent : [int] 
%inst


%index
IDXGIOutput_GetDesc
Get a description of the output.
%group
COM misc / IDXGIOutput
%prm
this
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
%inst
Get a description of the output.

[戻り値]
Type: HRESULT Returns a code that indicates success or failure. S_OK
if successful, DXGI_ERROR_INVALID_CALL if pDesc is passed in as NULL.

[備考]
On a high DPI desktop, GetDesc returns the visualized screen size
unless the app is marked high DPI aware. For info about writing
DPI-aware Win32 apps, see High DPI.


%index
IDXGIOutput_GetDisplayModeList
Gets the display modes that match the requested format and other input options. (IDXGIOutput.GetDisplayModeList)
%group
COM misc / IDXGIOutput
%prm
this, EnumFormat, Flags, pNumModes, pDesc
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
EnumFormat : [int] Type: DXGI_FORMAT The color format (see DXGI_FORMAT).
Flags : [int] Type: UINT Options for modes to include (see DXGI_ENUM_MODES). DXGI_ENUM_MODES_SCALING needs to be specified to expose the display modes that require scaling.  Centered modes, requiring no scaling and corresponding directly to the display output, are enumerated by default.
pNumModes : [int] Type: UINT* Set pDesc to NULL so that pNumModes returns the number of display modes that match the format and the options. Otherwise, pNumModes returns the number of display modes returned in pDesc.
pDesc : [var] Type: DXGI_MODE_DESC* A pointer to a list of display modes (see DXGI_MODE_DESC); set to NULL to get the number of display modes.
%inst
Gets the display modes that match the requested format and other
input options. (IDXGIOutput.GetDisplayModeList)

[戻り値]
Type: HRESULT Returns one of the following DXGI_ERROR. It is rare,
but possible, that the display modes available can change immediately
after calling this method, in which case DXGI_ERROR_MORE_DATA is
returned (if there is not enough room for all the display modes). If
GetDisplayModeList is called from a Remote Desktop Services session
(formerly Terminal Services session),
DXGI_ERROR_NOT_CURRENTLY_AVAILABLE is returned.

[備考]
In general, when switching from windowed to full-screen mode, a swap
chain automatically chooses a display mode that meets (or exceeds)
the resolution, color depth and refresh rate of the swap chain. To
exercise more control over the display mode, use this API to poll the
set of display modes that are validated against monitor capabilities,
or all modes that match the desktop (if the desktop settings are not
validated against the monitor). As shown, this API is designed to be
called twice. First to get the number of modes available, and second
to return a description of the modes.
This doc was truncated.


%index
IDXGIOutput_FindClosestMatchingMode
Finds the display mode that most closely matches the requested display mode. (IDXGIOutput.FindClosestMatchingMode)
%group
COM misc / IDXGIOutput
%prm
this, pModeToMatch, pClosestMatch, pConcernedDevice
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
pModeToMatch : [var] Type: const DXGI_MODE_DESC* The desired display mode (see DXGI_MODE_DESC). Members of DXGI_MODE_DESC can be unspecified indicating no preference for that member.  A value of 0 for Width or Height indicates the value is unspecified.  If either Width or Height are 0, both must be 0.  A numerator and denominator of 0 in RefreshRate indicate it is unspecified. Other members of DXGI_MODE_DESC have enumeration values indicating the member is unspecified.  If pConcernedDevice is NULL, Format cannot be DXGI_FORMAT_UNKNOWN.
pClosestMatch : [var] Type: DXGI_MODE_DESC* The mode that most closely matches pModeToMatch.
pConcernedDevice : [int] Type: IUnknown* A pointer to the Direct3D device interface. If this parameter is NULL, only modes whose format matches that of pModeToMatch will be returned; otherwise, only those formats that are supported for scan-out by the device are returned. For info about the formats that are supported for scan-out by the device at each feature level:
%inst
Finds the display mode that most closely matches the requested
display mode. (IDXGIOutput.FindClosestMatchingMode)

[戻り値]
Type: HRESULT Returns one of the following DXGI_ERROR.

[備考]
FindClosestMatchingMode behaves similarly to the
IDXGIOutput1::FindClosestMatchingMode1 except FindClosestMatchingMode
considers only the mono display modes.
IDXGIOutput1::FindClosestMatchingMode1 considers only stereo modes if
you set the Stereo member in the DXGI_MODE_DESC1 structure that
pModeToMatch points to, and considers only mono modes if Stereo is
not set.
IDXGIOutput1::FindClosestMatchingMode1 returns a matched display-mode
set with only stereo modes or only mono modes.
FindClosestMatchingMode behaves as though you specified the input
mode as mono.


%index
IDXGIOutput_WaitForVBlank
Halt a thread until the next vertical blank occurs.
%group
COM misc / IDXGIOutput
%prm
this
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
%inst
Halt a thread until the next vertical blank occurs.

[戻り値]
Type: HRESULT Returns one of the following DXGI_ERROR.

[備考]
A vertical blank occurs when the raster moves from the lower right
corner to the upper left corner to begin drawing the next frame.


%index
IDXGIOutput_TakeOwnership
Takes ownership of an output.
%group
COM misc / IDXGIOutput
%prm
this, pDevice, Exclusive
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
pDevice : [int] Type: IUnknown* A pointer to the IUnknown interface of a device (such as an ID3D10Device).
Exclusive : [int] Type: BOOL Set to TRUE to enable other threads or applications to take ownership of the device; otherwise, set to FALSE.
%inst
Takes ownership of an output.

[戻り値]
Type: HRESULT Returns one of the DXGI_ERROR values.

[備考]
When you are finished with the output, call
IDXGIOutput::ReleaseOwnership. TakeOwnership should not be called
directly by applications, since results will be unpredictable. It is
called implicitly by the DXGI swap chain object during full-screen
transitions, and should not be used as a substitute for swap-chain
methods. Notes for Windows Store apps If a Windows Store app uses
TakeOwnership, it fails with DXGI_ERROR_NOT_CURRENTLY_AVAILABLE.


%index
IDXGIOutput_ReleaseOwnership
Releases ownership of the output.
%group
COM misc / IDXGIOutput
%prm
this
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
%inst
Releases ownership of the output.

[備考]
If you are not using a swap chain, get access to an output by calling
IDXGIOutput::TakeOwnership and release it when you are finished by
calling IDXGIOutput::ReleaseOwnership. An application that uses a
swap chain will typically not call either of these methods.


%index
IDXGIOutput_GetGammaControlCapabilities
Gets a description of the gamma-control capabilities.
%group
COM misc / IDXGIOutput
%prm
this, pGammaCaps
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
pGammaCaps : [var] Type: DXGI_GAMMA_CONTROL_CAPABILITIES* A pointer to a  description of the gamma-control capabilities (see DXGI_GAMMA_CONTROL_CAPABILITIES).
%inst
Gets a description of the gamma-control capabilities.

[戻り値]
Type: HRESULT Returns one of the DXGI_ERROR values.

[備考]
Note Calling this method is only supported while in full-screen mode.
For info about using gamma correction, see Using gamma correction.


%index
IDXGIOutput_SetGammaControl
Sets the gamma controls.
%group
COM misc / IDXGIOutput
%prm
this, pArray
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
pArray : [var] Type: const DXGI_GAMMA_CONTROL* A pointer to a DXGI_GAMMA_CONTROL structure that describes the gamma curve to set.
%inst
Sets the gamma controls.

[戻り値]
Type: HRESULT Returns one of the DXGI_ERROR values.

[備考]
Note Calling this method is only supported while in full-screen mode.
For info about using gamma correction, see Using gamma correction.


%index
IDXGIOutput_GetGammaControl
Gets the gamma control settings.
%group
COM misc / IDXGIOutput
%prm
this, pArray
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
pArray : [var] Type: DXGI_GAMMA_CONTROL* An array of gamma control settings (see DXGI_GAMMA_CONTROL).
%inst
Gets the gamma control settings.

[戻り値]
Type: HRESULT Returns one of the DXGI_ERROR values.

[備考]
Note Calling this method is only supported while in full-screen mode.
For info about using gamma correction, see Using gamma correction.


%index
IDXGIOutput_SetDisplaySurface
Changes the display mode.
%group
COM misc / IDXGIOutput
%prm
this, pScanoutSurface
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
pScanoutSurface : [comobj] Type: IDXGISurface* A pointer to a surface (see IDXGISurface) used for rendering an image to the screen. The surface must have been created as a back buffer (DXGI_USAGE_BACKBUFFER).
%inst
Changes the display mode.

[戻り値]
Type: HRESULT Returns one of the DXGI_ERROR values.

[備考]
IDXGIOutput::SetDisplaySurface should not be called directly by
applications, since results will be unpredictable. It is called
implicitly by the DXGI swap chain object during full-screen
transitions, and should not be used as a substitute for swap-chain
methods. This method should only be called between
IDXGIOutput::TakeOwnership and IDXGIOutput::ReleaseOwnership calls.
Notes for Windows Store apps If a Windows Store app uses
SetDisplaySurface, it fails with DXGI_ERROR_NOT_CURRENTLY_AVAILABLE.


%index
IDXGIOutput_GetDisplaySurfaceData
Gets a copy of the current display surface.
%group
COM misc / IDXGIOutput
%prm
this, pDestination
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
pDestination : [comobj] Type: IDXGISurface* A pointer to a destination surface (see IDXGISurface).
%inst
Gets a copy of the current display surface.

[戻り値]
Type: HRESULT Returns one of the DXGI_ERROR values.

[備考]
IDXGIOutput::GetDisplaySurfaceData can only be called when an output
is in full-screen mode. If the method succeeds, DXGI fills the
destination surface. Use IDXGIOutput::GetDesc to determine the size
(width and height) of the output when you want to allocate space for
the destination surface. This is true regardless of target monitor
rotation. A destination surface created by a graphics component (such
as Direct3D 10) must be created with CPU-write permission (see
D3D10_CPU_ACCESS_WRITE). Other surfaces should be created with CPU
read-write permission (see D3D10_CPU_ACCESS_READ_WRITE). This method
will modify the surface data to fit the destination surface (stretch,
shrink, convert format, rotate). The stretch and shrink is performed
with point-sampling.


%index
IDXGIOutput_GetFrameStatistics
Gets statistics about recently rendered frames.
%group
COM misc / IDXGIOutput
%prm
this, pStats
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
pStats : [var] Type: DXGI_FRAME_STATISTICS* A pointer to frame statistics (see DXGI_FRAME_STATISTICS).
%inst
Gets statistics about recently rendered frames.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it might return DXGI_ERROR_INVALID_CALL.

[備考]
This API is similar to IDXGISwapChain::GetFrameStatistics.
Note Calling this method is only supported while in full-screen mode.


%index
IDXGISurface_SetPrivateData
IDXGISurface::SetPrivateData (vtable slot 3)
%group
COM misc / IDXGISurface
%prm
this, Name, DataSize, pData
this : [comobj] IDXGISurface インターフェースの COM オブジェクト変数
Name : [var] 
DataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGISurface_SetPrivateDataInterface
IDXGISurface::SetPrivateDataInterface (vtable slot 4)
%group
COM misc / IDXGISurface
%prm
this, Name, pUnknown
this : [comobj] IDXGISurface インターフェースの COM オブジェクト変数
Name : [var] 
pUnknown : [int] 
%inst


%index
IDXGISurface_GetPrivateData
IDXGISurface::GetPrivateData (vtable slot 5)
%group
COM misc / IDXGISurface
%prm
this, Name, pDataSize, pData
this : [comobj] IDXGISurface インターフェースの COM オブジェクト変数
Name : [var] 
pDataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGISurface_GetParent
IDXGISurface::GetParent (vtable slot 6)
%group
COM misc / IDXGISurface
%prm
this, riid, ppParent
this : [comobj] IDXGISurface インターフェースの COM オブジェクト変数
riid : [var] 
ppParent : [int] 
%inst


%index
IDXGISurface_GetDevice
IDXGISurface::GetDevice (vtable slot 7)
%group
COM misc / IDXGISurface
%prm
this, riid, ppDevice
this : [comobj] IDXGISurface インターフェースの COM オブジェクト変数
riid : [var] 
ppDevice : [int] 
%inst


%index
IDXGISurface_GetDesc
Get a description of the surface.
%group
COM misc / IDXGISurface
%prm
this
this : [comobj] IDXGISurface インターフェースの COM オブジェクト変数
%inst
Get a description of the surface.

[戻り値]
Type: HRESULT Returns S_OK if successful; otherwise, returns one of
the error codes that are described in the DXGI_ERROR topic.


%index
IDXGISurface_Map
Get a pointer to the data contained in the surface, and deny GPU access to the surface.
%group
COM misc / IDXGISurface
%prm
this, pLockedRect, MapFlags
this : [comobj] IDXGISurface インターフェースの COM オブジェクト変数
pLockedRect : [var] Type: DXGI_MAPPED_RECT* A pointer to the surface data (see DXGI_MAPPED_RECT).
MapFlags : [int] Type: UINT CPU read-write flags. These flags can be combined with a logical OR.
%inst
Get a pointer to the data contained in the surface, and deny GPU
access to the surface.

[戻り値]
Type: HRESULT Returns S_OK if successful; otherwise, returns one of
the error codes that are described in the DXGI_ERROR topic.

[備考]
Use IDXGISurface::Map to access a surface from the CPU. To release a
mapped surface (and allow GPU access) call IDXGISurface::Unmap.


%index
IDXGISurface_Unmap
Invalidate the pointer to the surface retrieved by IDXGISurface::Map and re-enable GPU access to the resource.
%group
COM misc / IDXGISurface
%prm
this
this : [comobj] IDXGISurface インターフェースの COM オブジェクト変数
%inst
Invalidate the pointer to the surface retrieved by IDXGISurface::Map
and re-enable GPU access to the resource.

[戻り値]
Type: HRESULT Returns S_OK if successful; otherwise, returns one of
the error codes that are described in the DXGI_ERROR topic.


%index
IDXGISwapChain_SetPrivateData
IDXGISwapChain::SetPrivateData (vtable slot 3)
%group
COM misc / IDXGISwapChain
%prm
this, Name, DataSize, pData
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
Name : [var] 
DataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGISwapChain_SetPrivateDataInterface
IDXGISwapChain::SetPrivateDataInterface (vtable slot 4)
%group
COM misc / IDXGISwapChain
%prm
this, Name, pUnknown
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
Name : [var] 
pUnknown : [int] 
%inst


%index
IDXGISwapChain_GetPrivateData
IDXGISwapChain::GetPrivateData (vtable slot 5)
%group
COM misc / IDXGISwapChain
%prm
this, Name, pDataSize, pData
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
Name : [var] 
pDataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGISwapChain_GetParent
IDXGISwapChain::GetParent (vtable slot 6)
%group
COM misc / IDXGISwapChain
%prm
this, riid, ppParent
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
riid : [var] 
ppParent : [int] 
%inst


%index
IDXGISwapChain_GetDevice
IDXGISwapChain::GetDevice (vtable slot 7)
%group
COM misc / IDXGISwapChain
%prm
this, riid, ppDevice
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
riid : [var] 
ppDevice : [int] 
%inst


%index
IDXGISwapChain_Present
Presents a rendered image to the user.
%group
COM misc / IDXGISwapChain
%prm
this, SyncInterval, Flags
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
SyncInterval : [int] Type: UINT An integer that specifies how to synchronize presentation of a frame with the vertical blank.
Flags : [int] Type: UINT An integer value that contains swap-chain presentation options. These options are defined by the DXGI_PRESENT constants.
%inst
Presents a rendered image to the user.

[戻り値]
Type: HRESULT Possible return values include: S_OK,
DXGI_ERROR_DEVICE_RESET or DXGI_ERROR_DEVICE_REMOVED (see
DXGI_ERROR), DXGI_STATUS_OCCLUDED (see DXGI_STATUS), or
D3DDDIERR_DEVICEREMOVED. Note The Present method can return either
DXGI_ERROR_DEVICE_REMOVED or D3DDDIERR_DEVICEREMOVED if a video card
has been physically removed from the computer, or a driver upgrade
for the video card has occurred.

[備考]
Starting with Direct3D 11.1, consider using IDXGISwapChain1::Present1
because you can then use dirty rectangles and the scroll rectangle in
the swap chain presentation and as such use less memory bandwidth and
as a result less system power. For more info about using dirty
rectangles and the scroll rectangle in swap chain presentation, see
Using dirty rectangles and the scroll rectangle in swap chain
presentation. For the best performance when flipping swap-chain
buffers in a full-screen application, see Full-Screen Application
Performance Hints. Because calling Present might cause the render
thread to wait on the message-pump thread, be careful when calling
this method in an application that uses multiple threads. For more
details, see Multithreading Considerations.
This doc was truncated.


%index
IDXGISwapChain_GetBuffer
Accesses one of the swap-chain's back buffers.
%group
COM misc / IDXGISwapChain
%prm
this, Buffer, riid, ppSurface
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
Buffer : [int] Type: UINT A zero-based buffer index. If the swap chain's swap effect is DXGI_SWAP_EFFECT_DISCARD, this method can only access the first buffer; for this situation, set the index to zero. If the swap chain's swap effect is either DXGI_SWAP_EFFECT_SEQUENTIAL or DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL, only the swap chain's zero-index buffer can be read from and written to. The swap chain's buffers with indexes greater than zero can only be read from; so if you call the IDXGIResource::GetUsage method for such buffers, they have the DXGI_USAGE_READ_ONLY flag set.
riid : [var] Type: REFIID The type of interface used to manipulate the buffer.
ppSurface : [int] Type: void** A pointer to a back-buffer interface.
%inst
Accesses one of the swap-chain's back buffers.

[戻り値]
Type: HRESULT Returns one of the following DXGI_ERROR.


%index
IDXGISwapChain_SetFullscreenState
Sets the display state to windowed or full screen.
%group
COM misc / IDXGISwapChain
%prm
this, Fullscreen, pTarget
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
Fullscreen : [int] Type: BOOL A Boolean value that specifies whether to set the display state to windowed or full screen. TRUE for full screen, and FALSE for windowed.
pTarget : [comobj] Type: [in, optional] IDXGIOutput* If you pass TRUE to the Fullscreen parameter to set the display state to full screen, you can optionally set this parameter to a pointer to an IDXGIOutput interface for the output target that contains the swap chain. If you set this parameter to NULL, DXGI will choose the output based on the swap-chain's device and the output window's placement. If you pass FALSE to Fullscreen, then you must set this parameter to NULL.
%inst
Sets the display state to windowed or full screen.

[戻り値]
Type: HRESULT This method returns one of these values. - **S_OK** if
the action succeeded and the swap chain was placed in the requested
state. - **DXGI_ERROR_NOT_CURRENTLY_AVAILABLE** if the action failed.
When this error is returned, your application can continue to run in
windowed mode and try to switch to full-screen mode later. There are
many reasons why a windowed-mode swap chain cannot switch to
full-screen mode. Here are some examples. - The application is
running over Terminal Server. - The output window is occluded. - The
output window does not have keyboard focus. - Another application is
already in full-screen mode. -
**DXGI_STATUS_MODE_CHANGE_IN_PROGRESS** is returned if a
fullscreen/windowed mode transition is occurring when this API is
called. - Other error codes if you run out of memory or encounter
another unexpected fault; these codes may be treated as hard,
non-continuable errors.

[備考]
DXGI may change the display state of a swap chain in response to end
user or system requests. We recommend that you create a windowed swap
chain and allow the end user to change the swap chain to full screen
through SetFullscreenState; that is, do not set the Windowed member
of DXGI_SWAP_CHAIN_DESC to FALSE to force the swap chain to be full
screen. However, if you create the swap chain as full screen, also
provide the end user with a list of supported display modes because a
swap chain that is created with an unsupported display mode might
cause the display to go black and prevent the end user from seeing
anything. Also, we recommend that you have a time-out confirmation
screen or other fallback mechanism when you allow the end user to
change display modes. Notes for Windows Store apps If a Windows Store
app calls SetFullscreenState to set the display state to full screen,
SetFullscreenState fails with DXGI_ERROR_NOT_CURRENTLY_AVAILABLE. You
cannot call SetFullscreenState on a swap chain that you created with
IDXGIFactory2::CreateSwapChainForComposition. For the flip
presentation model, after you transition the display state to full
screen, you must call ResizeBuffers to ensure that your call to
IDXGISwapChain1::Present1 succeeds.


%index
IDXGISwapChain_GetFullscreenState
Get the state associated with full-screen mode.
%group
COM misc / IDXGISwapChain
%prm
this, pFullscreen, ppTarget
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
pFullscreen : [var] Type: BOOL* A pointer to a boolean whose value is either:
ppTarget : [comobj] Type: IDXGIOutput** A pointer to the output target (see IDXGIOutput) when the mode is full screen; otherwise NULL.
%inst
Get the state associated with full-screen mode.

[戻り値]
Type: HRESULT Returns one of the following DXGI_ERROR.

[備考]
When the swap chain is in full-screen mode, a pointer to the target
output will be returned and its reference count will be incremented.


%index
IDXGISwapChain_GetDesc
Get a description of the swap chain.
%group
COM misc / IDXGISwapChain
%prm
this
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
%inst
Get a description of the swap chain.

[戻り値]
Type: HRESULT Returns one of the following DXGI_ERROR.


%index
IDXGISwapChain_ResizeBuffers
Changes the swap chain's back buffer size, format, and number of buffers. This should be called when the application window is resized.
%group
COM misc / IDXGISwapChain
%prm
this, BufferCount, Width, Height, NewFormat, SwapChainFlags
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
BufferCount : [int] Type: UINT The number of buffers in the swap chain (including all back and front buffers). This number can be different from the number of buffers with which you created the swap chain. This number can't be greater than DXGI_MAX_SWAP_CHAIN_BUFFERS. Set this number to zero to preserve the existing number of buffers in the swap chain. You can't specify less than two buffers for the flip presentation model.
Width : [int] Type: UINT The new width of the back buffer. If you specify zero, DXGI will use the width of the client area of the target window. You can't specify the width as zero if you called the IDXGIFactory2::CreateSwapChainForComposition method to create the swap chain for a composition surface.
Height : [int] Type: UINT The new height of the back buffer. If you specify zero, DXGI will use the height of the client area of the target window. You can't specify the height as zero if you called the IDXGIFactory2::CreateSwapChainForComposition method to create the swap chain for a composition surface.
NewFormat : [int] Type: DXGI_FORMAT A DXGI_FORMAT-typed value for the new format of the back buffer. Set this value to DXGI_FORMAT_UNKNOWN to preserve the existing format of the back buffer. The flip presentation model supports a more restricted set of formats than the bit-block transfer (bitblt) model.
SwapChainFlags : [int] Type: UINT A combination of DXGI_SWAP_CHAIN_FLAG-typed values that are combined by using a bitwise OR operation. The resulting value specifies options for swap-chain behavior.
%inst
Changes the swap chain's back buffer size, format, and number of
buffers. This should be called when the application window is
resized.

[戻り値]
Type: HRESULT Returns S_OK if successful; an error code otherwise.
For a list of error codes, see DXGI_ERROR.

[備考]
You can't resize a swap chain unless you release all outstanding
references to its back buffers. You must release all of its direct
and indirect references on the back buffers in order for
ResizeBuffers to succeed.
Direct references are held by the application after it calls AddRef
on a resource.
Indirect references are held by views to a resource, binding a view
of the resource to a device context, a command list that used the
resource, a command list that used a view to that resource, a command
list that executed another command list that used the resource, and
so on.
Before you call ResizeBuffers, ensure that the application releases
all references (by calling the appropriate number of Release
invocations) on the resources, any views to the resource, and any
command lists that use either the resources or views, and ensure that
neither the resource nor a view is still bound to a device context.
You can use ID3D11DeviceContext::ClearState to ensure that all
references are released. If a view is bound to a deferred context,
you must discard the partially built command list as well (by calling
ID3D11DeviceContext::ClearState, then
ID3D11DeviceContext::FinishCommandList, then Release on the command
list). After you call ResizeBuffers, you can re-query interfaces via
IDXGISwapChain::GetBuffer.
For swap chains that you created with
DXGI_SWAP_CHAIN_FLAG_GDI_COMPATIBLE, before you call ResizeBuffers,
also call IDXGISurface1::ReleaseDC on the swap chain's back-buffer
surface to ensure that you have no outstanding GDI device contexts
(DCs) open.
We recommend that you call ResizeBuffers when a client window is
resized (that is, when an application receives a WM_SIZE message).
The only difference between IDXGISwapChain::ResizeBuffers in Windows
8 versus Windows 7 is with flip presentation model swap chains that
you create with the DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL or
DXGI_SWAP_EFFECT_FLIP_DISCARD value set. In Windows 8, you must call
ResizeBuffers to realize a transition between full-screen mode and
windowed mode; otherwise, your next call to the
IDXGISwapChain::Present method fails.


%index
IDXGISwapChain_ResizeTarget
Resizes the output target.
%group
COM misc / IDXGISwapChain
%prm
this, pNewTargetParameters
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
pNewTargetParameters : [var] Type: const DXGI_MODE_DESC* A pointer to a DXGI_MODE_DESC structure that describes the mode, which specifies the new width, height, format, and refresh rate of the target. If the format is DXGI_FORMAT_UNKNOWN, ResizeTarget uses the existing format. We only recommend that you use DXGI_FORMAT_UNKNOWN when the swap chain is in full-screen mode as this method is not thread safe.
%inst
Resizes the output target.

[戻り値]
Type: HRESULT Returns a code that indicates success or failure.
DXGI_STATUS_MODE_CHANGE_IN_PROGRESS is returned if a
full-screen/windowed mode transition is occurring when this API is
called. See DXGI_ERROR for additional DXGI error codes.

[備考]
ResizeTarget resizes the target window when the swap chain is in
windowed mode, and changes the display mode on the target output when
the swap chain is in full-screen mode. Therefore, apps can call
ResizeTarget to resize the target window (rather than a Microsoft
Win32API such as SetWindowPos) without knowledge of the swap chain
display mode. If a Windows Store app calls ResizeTarget, it fails
with DXGI_ERROR_NOT_CURRENTLY_AVAILABLE. You cannot call ResizeTarget
on a swap chain that you created with
IDXGIFactory2::CreateSwapChainForComposition. Apps must still call
IDXGISwapChain::ResizeBuffers after they call ResizeTarget because
only ResizeBuffers can change the back buffers. But, if those apps
have implemented window resize processing to call ResizeBuffers, they
don't need to explicitly call ResizeBuffers after they call
ResizeTarget because the window resize processing will achieve what
the app requires.


%index
IDXGISwapChain_GetContainingOutput
Get the output (the display monitor) that contains the majority of the client area of the target window.
%group
COM misc / IDXGISwapChain
%prm
this, ppOutput
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
ppOutput : [comobj] Type: IDXGIOutput** A pointer to the output interface (see IDXGIOutput).
%inst
Get the output (the display monitor) that contains the majority of
the client area of the target window.

[戻り値]
Type: HRESULT Returns one of the following DXGI_ERROR.

[備考]
If the method succeeds, the output interface will be filled and its
reference count incremented. When you are finished with it, be sure
to release the interface to avoid a memory leak. The output is also
owned by the adapter on which the swap chain's device was created.
You cannot call GetContainingOutput on a swap chain that you created
with IDXGIFactory2::CreateSwapChainForComposition. To determine the
output corresponding to such a swap chain, you should call
IDXGIFactory::EnumAdapters and then IDXGIAdapter::EnumOutputs to
enumerate over all of the available outputs. You should then
intersect the bounds of your CoreWindow::Bounds with the desktop
coordinates of each output, as reported by
DXGI_OUTPUT_DESC1::DesktopCoordinates or
DXGI_OUTPUT_DESC::DesktopCoordinates.


%index
IDXGISwapChain_GetFrameStatistics
Gets performance statistics about the last render frame.
%group
COM misc / IDXGISwapChain
%prm
this, pStats
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
pStats : [var] Type: DXGI_FRAME_STATISTICS* A pointer to a DXGI_FRAME_STATISTICS structure for the frame statistics.
%inst
Gets performance statistics about the last render frame.

[戻り値]
Type: HRESULT Returns one of the DXGI_ERROR values.

[備考]
You cannot use GetFrameStatistics for swap chains that both use the
bit-block transfer (bitblt) presentation model and draw in windowed
mode. You can only use GetFrameStatistics for swap chains that either
use the flip presentation model or draw in full-screen mode. You set
the DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL value in the SwapEffect member
of the DXGI_SWAP_CHAIN_DESC1 structure to specify that the swap chain
uses the flip presentation model. Statistics are not reliable in many
multiple monitor scenarios, as well as scenarios where other
fullscreen apps are running.


%index
IDXGISwapChain_GetLastPresentCount
Gets the number of times that IDXGISwapChain::Present or IDXGISwapChain1::Present1 has been called.
%group
COM misc / IDXGISwapChain
%prm
this, pLastPresentCount
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
pLastPresentCount : [int] Type: UINT* A pointer to a variable that receives the number of calls.
%inst
Gets the number of times that IDXGISwapChain::Present or
IDXGISwapChain1::Present1 has been called.

[戻り値]
Type: HRESULT Returns one of the DXGI_ERROR values.

[備考]
For info about presentation statistics for a frame, see
DXGI_FRAME_STATISTICS.


%index
IEnumFORMATETC_Next
列挙シーケンスから指定した数のアイテムを取得する。(IEnumFORMATETC.Next)
%group
COM misc / IEnumFORMATETC
%prm
this, celt, rgelt, pceltFetched
this : [comobj] IEnumFORMATETC インターフェースの COM オブジェクト変数
celt : [int] 取得するアイテム数。シーケンスに残っているアイテム数が要求より少ない場合、残りの要素を取得する。
rgelt : [var] 列挙されたアイテムの配列。列挙子がメモリの確保を行い、呼び出し側が解放する責任を負う。celt が 1 より大きい場合、呼び出し側は解放すべきポインターの数を知るために pceltFetched に NULL 以外のポインターを渡さなければならない。
pceltFetched : [var] 取得されたアイテム数。このパラメーターは常に要求されたアイテム数以下になる。celt が 1 の場合、このパラメーターは NULL でもよい。
%inst
列挙シーケンスから指定した数のアイテムを取得する。(IEnumFORMATETC.Next)

[戻り値]
メソッドが要求された数のアイテムを取得した場合、戻り値は S_OK。そうでなければ S_FALSE。


%index
IEnumFORMATETC_Skip
列挙シーケンス内で指定した数のアイテムをスキップする。(IEnumFORMATETC.Skip)
%group
COM misc / IEnumFORMATETC
%prm
this, celt
this : [comobj] IEnumFORMATETC インターフェースの COM オブジェクト変数
celt : [int] スキップするアイテム数。
%inst
列挙シーケンス内で指定した数のアイテムをスキップする。(IEnumFORMATETC.Skip)

[戻り値]
メソッドが要求された数のアイテムをスキップした場合、戻り値は S_OK。そうでなければ S_FALSE。


%index
IEnumFORMATETC_Reset
列挙シーケンスを先頭にリセットする。(IEnumFORMATETC.Reset)
%group
COM misc / IEnumFORMATETC
%prm
this
this : [comobj] IEnumFORMATETC インターフェースの COM オブジェクト変数
%inst
列挙シーケンスを先頭にリセットする。(IEnumFORMATETC.Reset)

[戻り値]
成功時は S_OK を返す。

[備考]

リセット操作完了後に同じオブジェクトの集合が列挙される保証はない。静的なコレクションは先頭にリセットされるが、ディレクトリ内のファイルなど一部のコレクションではこの条件を保証するのが高コストになる。


%index
IEnumFORMATETC_Clone
現在の列挙子と同じ列挙状態を持つ新しい列挙子を作成する。(IEnumFORMATETC.Clone)
%group
COM misc / IEnumFORMATETC
%prm
this, ppenum
this : [comobj] IEnumFORMATETC インターフェースの COM オブジェクト変数
ppenum : [comobj] 列挙オブジェクトへのインターフェースポインターを受け取る IEnumFORMATETC ポインター変数のアドレス。メソッドが失敗した場合、この出力変数の値は未定義。
%inst
現在の列挙子と同じ列挙状態を持つ新しい列挙子を作成する。(IEnumFORMATETC.Clone)

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）


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
IEnumUnknown_Next
The IEnumUnknown::Next (objidlbase.h) method retrieves the specified number of items in the enumeration sequence.
%group
COM misc / IEnumUnknown
%prm
this, celt, rgelt, pceltFetched
this : [comobj] IEnumUnknown インターフェースの COM オブジェクト変数
celt : [int] The number of items to be retrieved. If there are fewer than the requested number of items left in the sequence, this method retrieves the remaining elements.
rgelt : [int] An array of enumerated items. The enumerator is responsible for calling AddRef, and the caller is responsible for calling Release through each pointer enumerated. If celt is greater than 1, the caller must also pass a non-NULL pointer passed to pceltFetched to know how many pointers to release.
pceltFetched : [var] The number of items that were retrieved. This parameter is always less than or equal to the number of items requested.
%inst
The IEnumUnknown::Next (objidlbase.h) method retrieves the specified
number of items in the enumeration sequence.

[戻り値]
If the method retrieves the number of items requested, the return
value is S_OK. Otherwise, it is S_FALSE.


%index
IEnumUnknown_Skip
The IEnumUnknown::Skip (objidlbase.h) method skips over the specified number of items in the enumeration sequence.
%group
COM misc / IEnumUnknown
%prm
this, celt
this : [comobj] IEnumUnknown インターフェースの COM オブジェクト変数
celt : [int] The number of items to be skipped.
%inst
The IEnumUnknown::Skip (objidlbase.h) method skips over the specified
number of items in the enumeration sequence.

[戻り値]
If the method skips the number of items requested, the return value
is S_OK. Otherwise, it is S_FALSE.


%index
IEnumUnknown_Reset
The IEnumUnknown::Reset (objidlbase.h) method resets the enumeration sequence to the beginning.
%group
COM misc / IEnumUnknown
%prm
this
this : [comobj] IEnumUnknown インターフェースの COM オブジェクト変数
%inst
The IEnumUnknown::Reset (objidlbase.h) method resets the enumeration
sequence to the beginning.

[戻り値]
The return value is S_OK.

[備考]
There is no guarantee that the same set of objects will be enumerated
after the reset operation has completed. A static collection is reset
to the beginning, but it can be too expensive for some collections,
such as files in a directory, to guarantee this condition.


%index
IEnumUnknown_Clone
The IEnumUnknown::Clone (objidlbase.h) method creates a new enumerator that contains the same enumeration state as the current one.
%group
COM misc / IEnumUnknown
%prm
this, ppenum
this : [comobj] IEnumUnknown インターフェースの COM オブジェクト変数
ppenum : [comobj] A pointer to the cloned enumerator object.
%inst
The IEnumUnknown::Clone (objidlbase.h) method creates a new
enumerator that contains the same enumeration state as the current
one.

[戻り値]
This method can return the standard return values E_INVALIDARG,
E_OUTOFMEMORY, E_UNEXPECTED, and S_OK.


%index
IErrorLog_AddError
Adds an error for the specified property to the error log.
%group
COM misc / IErrorLog
%prm
this, pszPropName, pExcepInfo
this : [comobj] IErrorLog インターフェースの COM オブジェクト変数
pszPropName : [wstr] The address of the name of the property to read. This cannot be NULL.
pExcepInfo : [int] Pointer to an array of [EXCEPINFO](ns-oaidl-excepinfo.md) structures.
%inst
Adds an error for the specified property to the error log.


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
ダイアログが開く、または保存できるファイルタイプを設定する。
%group
COM misc / IFileDialog
%prm
this, cFileTypes, rgFilterSpec
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
cFileTypes : [int] 型: UINT rgFilterSpec で指定された配列の要素数。
rgFilterSpec : [var] 型: const COMDLG_FILTERSPEC* 各要素がファイルタイプを表す COMDLG_FILTERSPEC 構造体の配列へのポインター。
%inst
ダイアログが開く、または保存できるファイルタイプを設定する。

[戻り値]
型: HRESULT メソッドが成功した場合 S_OK を返す。そうでなければ以下を含む HRESULT エラーコードを返す。
（以下省略）

[備考]

オープンダイアログを使用する場合、ここで宣言したファイルタイプはビューのフィルターに使われる。セーブダイアログを使用する場合、これらの値はファイル名に追加されるファイル名拡張子を決定する。このメソッドはダイアログを表示する前に呼び出さなければならず、ダイアログインスタンスごとに
1 回しか呼び出せない。コモンアイテムダイアログボックスが表示された後はファイルタイプを変更できない。


%index
IFileDialog_SetFileTypeIndex
ダイアログで選択状態として表示されるファイルタイプを設定する。
%group
COM misc / IFileDialog
%prm
this, iFileType
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
iFileType : [int] 型: UINT IFileDialog::SetFileTypes の cFileTypes パラメーターに渡されたファイルタイプ配列におけるファイルタイプのインデックス。注意 これは 0 ベースではなく 1 ベースのインデックスである。
%inst
ダイアログで選択状態として表示されるファイルタイプを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
このメソッドはダイアログが表示される前に呼び出さなければならない。


%index
IFileDialog_GetFileTypeIndex
現在選択されているファイルタイプを取得する。
%group
COM misc / IFileDialog
%prm
this, piFileType
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
piFileType : [int] 型: UINT* IFileDialog::SetFileTypes の cFileTypes パラメーターに渡されたファイルタイプ配列における、選択中のファイルタイプのインデックスを受け取る UINT 値へのポインター。注意 これは 0 ベースではなく 1 ベースのインデックスである。
%inst
現在選択されているファイルタイプを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
IFileDialog::GetFileTypeIndex はダイアログが開いている間でも、閉じられた後でも呼び出せる。


%index
IFileDialog_Advise
ダイアログから送られるイベントを待ち受けるイベントハンドラーを割り当てる。
%group
COM misc / IFileDialog
%prm
this, pfde, pdwCookie
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pfde : [comobj] 型: IFileDialogEvents* ダイアログからのイベントを受け取る IFileDialogEvents 実装へのポインター。
pdwCookie : [int] 型: DWORD* このイベントハンドラーを識別する値を受け取る DWORD へのポインター。クライアントはダイアログの使用を終えたら、この値を指定して IFileDialog::Unadvise メソッドを呼び出さなければならない。
%inst
ダイアログから送られるイベントを待ち受けるイベントハンドラーを割り当てる。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IFileDialog_Unadvise
IFileDialog::Advise メソッドで取り付けたイベントハンドラーを取り除く。
%group
COM misc / IFileDialog
%prm
this, dwCookie
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
dwCookie : [int] 型: DWORD イベントハンドラーを表す DWORD 値。この値は IFileDialog::Advise メソッドの pdwCookie パラメーターから取得する。
%inst
IFileDialog::Advise メソッドで取り付けたイベントハンドラーを取り除く。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IFileDialog_SetOptions
ダイアログの動作を制御するフラグを設定する。
%group
COM misc / IFileDialog
%prm
this, fos
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
fos : [int] 型: FILEOPENDIALOGOPTIONS 1 つまたは複数の FILEOPENDIALOGOPTIONS 値。
%inst
ダイアログの動作を制御するフラグを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
一般にこのメソッドは IFileDialog::GetOptions
で取得した値を受け取り、適切なフラグを設定してオプションを追加または削除するように変更するために使用すべきである。


%index
IFileDialog_GetOptions
ダイアログの動作を制御するために設定されている現在のフラグを取得する。
%group
COM misc / IFileDialog
%prm
this, pfos
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pfos : [var] 型: FILEOPENDIALOGOPTIONS* このメソッドが正常に戻ったとき、FILEOPENDIALOGOPTIONS の 1 つまたは複数の値の組み合わせを指す。
%inst
ダイアログの動作を制御するために設定されている現在のフラグを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IFileDialog_SetDefaultFolder
最近使用したフォルダーの値が利用できない場合に既定として使用するフォルダーを設定する。
%group
COM misc / IFileDialog
%prm
this, psi
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
psi : [comobj] 型: IShellItem* フォルダーを表すインターフェースへのポインター。
%inst
最近使用したフォルダーの値が利用できない場合に既定として使用するフォルダーを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IFileDialog_SetFolder
ダイアログが開かれる際に、直前のユーザー操作に関わらず常に選択されるフォルダーを設定する。
%group
COM misc / IFileDialog
%prm
this, psi
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
psi : [comobj] 型: IShellItem* フォルダーを表すインターフェースへのポインター。
%inst
ダイアログが開かれる際に、直前のユーザー操作に関わらず常に選択されるフォルダーを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

このフォルダーは「最近使用した」フォルダーを上書きする。ダイアログ表示中にこのメソッドが呼び出されると、ダイアログは指定したフォルダーへナビゲートする。一般にこのメソッドの使用は推奨されない。ダイアログボックスを表示する前に
SetFolder
を呼び出すと、ユーザーが直近に保存したり開いたりした場所が表示されない。この動作を必要とする非常に具体的な理由がない限り、これは望ましいユーザー体験とは言えず、避けるべきである。ほとんどの場合
IFileDialog::SetDefaultFolder の方が適している。Windows 7 以降、psi
を介して指定したフォルダーのパスが既知フォルダーの既定パスである場合、ダイアログではその既知フォルダーの現在のパスが使用される。そのパスは
psi
で指定されたものとは異なる場合がある。例えば既知フォルダーがリダイレクトされているなどである。既知フォルダーがライブラリ（仮想フォルダーのドキュメント・ミュージック・ピクチャー・ビデオ）である場合、ダイアログではライブラリのパスが使用される。指定したライブラリが非表示（Windows
8.1 以降の既定ではそうなっている）の場合、ダイアログではライブラリの既定の保存場所（ドキュメントライブラリに対する Microsoft
OneDrive
ドキュメントフォルダーなど）が使用される。これらのマッピングのため、ダイアログで使用されるフォルダー位置は、このメソッドを呼び出したときに指定したものとは完全には一致しない場合がある。


%index
IFileDialog_GetFolder
ダイアログで現在選択されているフォルダー、またはダイアログが現在表示されていない場合はダイアログが開かれた際に選択されるフォルダーを取得する。
%group
COM misc / IFileDialog
%prm
this, ppsi
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] 型: IShellItem** フォルダーを表すインターフェースへのポインターのアドレス。
%inst

ダイアログで現在選択されているフォルダー、またはダイアログが現在表示されていない場合はダイアログが開かれた際に選択されるフォルダーを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
呼び出し側アプリケーションは取得した IShellItem が不要になったら解放する責任を負う。


%index
IFileDialog_GetCurrentSelection
ダイアログにおけるユーザーの現在の選択を取得する。
%group
COM misc / IFileDialog
%prm
this, ppsi
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] 型: IShellItem** ダイアログで現在選択されているアイテムを表すインターフェースへのポインターのアドレス。このアイテムはビューウィンドウで選択されているファイルやフォルダー、またはユーザーがダイアログの編集ボックスに入力した内容である場合がある。後者の場合は現在のスレッドをブロックする可能性のある解析操作（ユーザーによるキャンセル可）が必要になることがある。
%inst
ダイアログにおけるユーザーの現在の選択を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
呼び出し側アプリケーションは取得した IShellItem が不要になったら解放する責任を負う。


%index
IFileDialog_SetFileName
ダイアログが開かれたときにファイル名編集ボックスに表示されるファイル名を設定する。
%group
COM misc / IFileDialog
%prm
this, pszName
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pszName : [wstr] 型: LPCWSTR ファイル名へのポインター。
%inst
ダイアログが開かれたときにファイル名編集ボックスに表示されるファイル名を設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IFileDialog_GetFileName
ダイアログのファイル名編集ボックスに現在入力されているテキストを取得する。
%group
COM misc / IFileDialog
%prm
this, pszName
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pszName : [var] 型: WCHAR** このメソッドが正常に戻ったときにテキストを受け取るバッファへのポインターのアドレス。
%inst
ダイアログのファイル名編集ボックスに現在入力されているテキストを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
ファイル名編集ボックスのテキストは、ユーザーが選択したアイテムを必ずしも反映しない。ユーザーが選択したアイテムを取得するには
IFileDialog::GetResult を使用する。呼び出し側アプリケーションは取得したバッファを CoTaskMemFree
関数で解放する責任を負う。


%index
IFileDialog_SetTitle
ダイアログのタイトルを設定する。
%group
COM misc / IFileDialog
%prm
this, pszTitle
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pszTitle : [wstr] 型: LPCWSTR タイトルテキストを含むバッファへのポインター。
%inst
ダイアログのタイトルを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IFileDialog_SetOkButtonLabel
[開く] または [保存] ボタンのテキストを設定する。
%group
COM misc / IFileDialog
%prm
this, pszText
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pszText : [wstr] 型: LPCWSTR ボタンテキストを含むバッファへのポインター。
%inst
[開く] または [保存] ボタンのテキストを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IFileDialog_SetFileNameLabel
ファイル名編集ボックスの隣のラベルのテキストを設定する。
%group
COM misc / IFileDialog
%prm
this, pszLabel
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pszLabel : [wstr] 型: LPCWSTR ラベルテキストを含むバッファへのポインター。
%inst
ファイル名編集ボックスの隣のラベルのテキストを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IFileDialog_GetResult
ダイアログでユーザーが行った選択を取得する。
%group
COM misc / IFileDialog
%prm
this, ppsi
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] 型: IShellItem** ユーザーの選択を表す IShellItem へのポインターのアドレス。
%inst
ダイアログでユーザーが行った選択を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
IFileDialog::GetResult はダイアログが閉じられた後、または OnFileOk
イベント処理中に呼び出せる。それ以外のタイミングで呼び出すと失敗する。複数のアイテムが選択された場合、このメソッドは失敗する。複数アイテムの場合は
GetResults を呼び出す。
IFileDialog::GetResult で結果を取得できるようにするには、Show は成功コードを返していなければならない。


%index
IFileDialog_AddPlace
ユーザーがアイテムを開く、または保存するのに利用可能な場所のリストにフォルダーを追加する。
%group
COM misc / IFileDialog
%prm
this, psi, fdap
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
psi : [comobj] 型: IShellItem* ユーザーに利用可能にするフォルダーを表す IShellItem へのポインター。フォルダー以外は指定できない。
fdap : [int] 型: FDAP リスト内でフォルダーを配置する位置を指定する。FDAP を参照。
%inst
ユーザーがアイテムを開く、または保存するのに利用可能な場所のリストにフォルダーを追加する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
SHSetTemporaryPropertyForItem を使って psi パラメーターが表すアイテムに一時的な
PKEY_ItemNameDisplay プロパティを設定できる。このプロパティの値はアイテムの UI 名の代わりに使われる。


%index
IFileDialog_SetDefaultExtension
ファイル名に追加する既定の拡張子を設定する。
%group
COM misc / IFileDialog
%prm
this, pszDefaultExtension
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pszDefaultExtension : [wstr] 型: LPCWSTR 拡張子テキストを含むバッファへのポインター。この文字列には先頭のピリオドを含めない。例えば「jpg」は正しく、「.jpg」は正しくない。
%inst
ファイル名に追加する既定の拡張子を設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
ダイアログを表示する前にこのメソッドを呼び出した場合、ユーザーが新しいファイルタイプを選択すると（SetFileTypes
を参照）、ダイアログは既定の拡張子を自動的に更新する。


%index
IFileDialog_Close
ダイアログを閉じる。
%group
COM misc / IFileDialog
%prm
this, hr
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
hr : [intptr] 型: HRESULT 選択が行われる前にダイアログが閉じられたことを示すために Show が返すコード。
%inst
ダイアログを閉じる。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
アプリケーションはダイアログが開いている間にコールバックメソッドや関数からこのメソッドを呼び出せる。ダイアログは閉じられ、Show
メソッドは hr で指定された HRESULT を返す。このメソッドが呼び出された場合、IFileDialog::GetResult や
GetResults メソッドで利用可能な結果は存在せず、呼び出すと失敗する。


%index
IFileDialog_SetClientGuid
呼び出し側アプリケーションがダイアログの永続化状態に GUID を関連付けられるようにする。
%group
COM misc / IFileDialog
%prm
this, guid
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
guid : [var] 型: REFGUID このダイアログ状態に関連付ける GUID。
%inst
呼び出し側アプリケーションがダイアログの永続化状態に GUID を関連付けられるようにする。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

ダイアログの状態には直近に訪れたフォルダーやダイアログの位置とサイズなどが含まれる。通常この状態は実行可能ファイル名をもとに永続化される。GUID
を指定することで、アプリケーションは同じアプリケーション内でダイアログのバージョンごとに異なる永続化状態を持てる（インポートダイアログとオープンダイアログなど）。
IFileDialog::SetClientGuid はダイアログオブジェクト作成直後に呼び出すべきである。


%index
IFileDialog_ClearClientData
ダイアログに永続化されたすべての状態情報をクリアするよう指示する。
%group
COM misc / IFileDialog
%prm
this
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
%inst
ダイアログに永続化されたすべての状態情報をクリアするよう指示する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
永続化された情報はアプリケーションまたは GUID に関連付けることができる。IFileDialog::SetClientGuid
を使って GUID が設定されていた場合、その GUID が永続化された情報のクリアに使われる。


%index
IFileDialog_SetFilter
SetFilter は Windows 7 以降では使用できなくなった。
%group
COM misc / IFileDialog
%prm
this, pFilter
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pFilter : [comobj] 型: IShellItemFilter* 設定する IShellItemFilter へのポインター。
%inst
SetFilter は Windows 7 以降では使用できなくなった。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

アプリケーションがダイアログボックスのビューから特定のアイテムを取り除く特別なフィルタリングを行う必要がある場合にこのメソッドを使用できる。通常ビューに含まれる各アイテムに対して
IncludeItem が呼び出される。GetEnumFlagsForItem
は使用されない。ファイルタイプでフィルタリングする場合は、IShellItemFilter
を適用するよりもアイテム数の多いフォルダーで性能が良い可能性があるため、IFileDialog::SetFileTypes
を使用するべきである。


%index
IFileDialogEvents_OnFileOk
ダイアログが結果とともに返ろうとする直前に呼び出される。
%group
COM misc / IFileDialogEvents
%prm
this, pfd
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] 型: IFileDialog* ダイアログを表すインターフェースへのポインター。
%inst
ダイアログが結果とともに返ろうとする直前に呼び出される。

[戻り値]
型: HRESULT 実装は、ダイアログの現在の結果を受け入れる場合は S_OK を、拒否する場合は S_FALSE
を返すべきである。S_FALSE の場合、ダイアログは開いたままとなる。

[備考]
このメソッドが呼び出された時点で IFileDialog::GetResult および GetResults
メソッドが呼び出せる。アプリケーションはこのコールバックメソッドを使って、ダイアログが閉じる前に追加の検証を行ったり、ダイアログが閉じるのを阻止したりできる。ダイアログが閉じるのを阻止する場合、アプリケーションは原因を示す
UI を表示すべきである。UI の親 HWND を取得するには IFileDialog::QueryInterface 経由で
IOleWindow インターフェースを取得し、IOleWindow::GetWindow
を呼び出す。アプリケーションはこのメソッドを使ってファイルのオープンや保存にまつわるすべての処理を行うこともできる。


%index
IFileDialogEvents_OnFolderChanging
IFileDialogEvents::OnFolderChange の前に呼び出される。実装者が特定の場所へのナビゲーションを阻止できるようにする。
%group
COM misc / IFileDialogEvents
%prm
this, pfd, psiFolder
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] 型: IFileDialog* ダイアログを表すインターフェースへのポインター。
psiFolder : [comobj] 型: IShellItem* ダイアログがこれからナビゲートしようとしているフォルダーを表すインターフェースへのポインター。
%inst
IFileDialogEvents::OnFolderChange
の前に呼び出される。実装者が特定の場所へのナビゲーションを阻止できるようにする。

[戻り値]
型: HRESULT 成功時は S_OK、そうでなければエラー値を返す。戻り値が S_OK または E_NOTIMPL
の場合はフォルダー変更を続行できることを示す。

[備考]
呼び出し側アプリケーションはこのコールバック内で IFileDialog::SetFolder
を呼び出すことで、ナビゲーションを別のフォルダーへリダイレクトできる。実際のナビゲーションは
IFileDialogEvents::OnFolderChanging
が戻るまで行われない。呼び出し側アプリケーションが単に特定のフォルダーへのナビゲーションを阻止する場合、制限の理由を説明する UI
を表示するべきである。UI の親 HWND を取得するには IFileDialog 経由で IOleWindow
インターフェースを取得し、IOleWindow::GetWindow を呼び出す。


%index
IFileDialogEvents_OnFolderChange
ユーザーが新しいフォルダーへナビゲートしたときに呼び出される。
%group
COM misc / IFileDialogEvents
%prm
this, pfd
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] 型: IFileDialog* ダイアログを表すインターフェースへのポインター。
%inst
ユーザーが新しいフォルダーへナビゲートしたときに呼び出される。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
IFileDialogEvents::OnFolderChange はダイアログが開かれたときに呼び出される。


%index
IFileDialogEvents_OnSelectionChange
ユーザーがダイアログのビューで選択を変更したときに呼び出される。
%group
COM misc / IFileDialogEvents
%prm
this, pfd
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] 型: IFileDialog* ダイアログを表すインターフェースへのポインター。
%inst
ユーザーがダイアログのビューで選択を変更したときに呼び出される。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IFileDialogEvents_OnShareViolation
オープンまたはセーブ操作から発生する共有違反に対応できるようにする。
%group
COM misc / IFileDialogEvents
%prm
this, pfd, psi, pResponse
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] 型: IFileDialog* ダイアログを表すインターフェースへのポインター。
psi : [comobj] 型: IShellItem* 共有違反を起こしたアイテムを表すインターフェースへのポインター。
pResponse : [var] 型: FDE_SHAREVIOLATION_RESPONSE* 共有違反への応答を示す FDE_SHAREVIOLATION_RESPONSE 列挙子の値へのポインター。
%inst
オープンまたはセーブ操作から発生する共有違反に対応できるようにする。

[戻り値]
型: HRESULT 実装者はこのメソッドが実装されていない場合 E_NOTIMPL を返すべきである。そうでなければ S_OK
または適切なエラーコードを返す。

[備考]
このメソッドが呼び出される前に、IFileDialog::SetOptions で FOS_SHAREAWARE
フラグを設定しておかなければならない。共有違反は、ダイアログがファイルをテストした時点とアプリケーションがファイルを開いた時点の間にそのファイルがロックされる可能性があるため、アプリケーションがファイルを開こうとしたときに発生し得る。


%index
IFileDialogEvents_OnTypeChange
ダイアログが開かれたときに初期の選択ファイルタイプをアプリケーションに通知するために呼び出される。
%group
COM misc / IFileDialogEvents
%prm
this, pfd
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] 型: IFileDialog* ダイアログを表すインターフェースへのポインター。
%inst
ダイアログが開かれたときに初期の選択ファイルタイプをアプリケーションに通知するために呼び出される。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
このメソッドはダイアログが開かれたときにアプリケーションへ最初に選ばれたファイルタイプを通知するために呼び出される。アプリケーションの
IFileDialogEvents
内にタイプ変更に応答するコードがあれば、それに応じて応答できる。例えば特定のコントロールを隠すことができる。初期のファイルタイプはアプリケーションが制御しており、独自のチェックを行える。そのため便宜上このメソッドが提供されている。


%index
IFileDialogEvents_OnOverwrite
セーブダイアログからユーザーがファイルを上書きすることを選択したときに呼び出される。
%group
COM misc / IFileDialogEvents
%prm
this, pfd, psi, pResponse
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] 型: IFileDialog* ダイアログを表すインターフェースへのポインター。
psi : [comobj] 型: IShellItem* 上書きされるアイテムを表すインターフェースへのポインター。
pResponse : [var] 型: FDE_OVERWRITE_RESPONSE* 潜在的な上書き動作への応答を示す FDE_OVERWRITE_RESPONSE 列挙子の値へのポインター。
%inst
セーブダイアログからユーザーがファイルを上書きすることを選択したときに呼び出される。

[戻り値]
型: HRESULT 実装者はこのメソッドが実装されていない場合 E_NOTIMPL を返すべきである。そうでなければ S_OK
または適切なエラーコードを返す。

[備考]
このメソッドが呼び出される前に、IFileDialog::SetOptions で FOS_OVERWRITEPROMPT
フラグを設定しておかなければならない。


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
複数選択を許可するダイアログでユーザーが行った選択を取得する。
%group
COM misc / IFileOpenDialog
%prm
this, ppenum
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
ppenum : [comobj] 型: IShellItemArray** ダイアログで選択されたアイテムにアクセスするための IShellItemArray へのポインターのアドレス。
%inst
複数選択を許可するダイアログでユーザーが行った選択を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
このメソッドは選択が単一アイテムか複数アイテムかに関わらず使用できる。IFileOpenDialog::GetResults
はダイアログが閉じられた後、または IFileDialogEvents::OnFileOk
イベント処理中に呼び出せる。それ以外のタイミングで呼び出すと失敗する。
IFileOpenDialog::GetResults で結果を取得できるようにするには、Show
は成功コードを返していなければならない。


%index
IFileOpenDialog_GetSelectedItems
ダイアログで現在選択されているアイテムを取得する。これらのアイテムはビュー内で選択されているものや、ファイル名編集ボックスで選択されているテキストである場合がある。
%group
COM misc / IFileOpenDialog
%prm
this, ppsai
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
ppsai : [comobj] 型: IShellItemArray** 選択されたアイテムにアクセスするための IShellItemArray へのポインターのアドレス。
%inst

ダイアログで現在選択されているアイテムを取得する。これらのアイテムはビュー内で選択されているものや、ファイル名編集ボックスで選択されているテキストである場合がある。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

このメソッドは単一アイテム選択にも複数アイテム選択にも使用できる。ユーザーがファイル名フィールドに新しいテキストを入力している場合、この操作は時間がかかる可能性がある。アプリケーションがこのメソッドを呼び出すと、アプリケーションはファイル名フィールドのテキストを解析する。例えばネットワーク共有の場合、この操作にはある程度時間がかかることがある。ただしこの操作は
UI をブロックしない。ユーザーは操作を停止でき、その結果 IFileOpenDialog::GetSelectedItems
は失敗コードを返すことになる。


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
名前を付けて保存ダイアログで最初のエントリーとして使用されるアイテムを設定する。
%group
COM misc / IFileSaveDialog
%prm
this, psi
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
psi : [comobj] 型: IShellItem* アイテムを表す IShellItem へのポインター。
%inst
名前を付けて保存ダイアログで最初のエントリーとして使用されるアイテムを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

アイテムの名前がファイル名編集ボックスに表示され、それを含むフォルダーがビューで開かれる。これは一般に、アプリケーションが既に存在するアイテムを保存する際に使用する。新規アイテムの場合は
IFileDialog::SetFileName を使用する。


%index
IFileSaveDialog_SetProperties
保存されるアイテムに使用される既定値を定義するプロパティストアを提供する。
%group
COM misc / IFileSaveDialog
%prm
this, pStore
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pStore : [comobj] 型: IPropertyStore* 関連するメタデータを含むプロパティストアを表すインターフェースへのポインター。
%inst
保存されるアイテムに使用される既定値を定義するプロパティストアを提供する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

このメソッドはダイアログを開く前、および表示中ならいつでも呼び出せる。アイテムに固有のプロパティがある場合、ダイアログを表示する前にそれらのプロパティを渡してこのメソッドを呼び出すべきである。名前を付けて保存を使用する際、アプリケーションは保存するアイテムのプロパティをセーブダイアログに提供すべきである。これらのプロパティは、元のアイテムから
GPS_HANDLERPROPERTIESONLY フラグを指定して GetPropertyStore
を呼び出すことで取得する。ダイアログが閉じられた後に保存済みアイテムのプロパティ（ユーザーによって変更されている可能性がある）を取得するには、IFileSaveDialog::GetProperties
を呼び出す。プロパティ収集を有効にし、セーブダイアログに表示するプロパティを指示するには
IFileSaveDialog::SetCollectedProperties を使用する。


%index
IFileSaveDialog_SetCollectedProperties
セーブダイアログで収集されるプロパティを指定する。
%group
COM misc / IFileSaveDialog
%prm
this, pList, fAppendDefault
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pList : [comobj] 型: IPropertyDescriptionList* 収集するプロパティのリストを表すインターフェースへのポインター。このパラメーターは NULL でもよい。
fAppendDefault : [int] 型: BOOL pList で指定されたプロパティに加えて、現在選択中のファイルタイプの既定プロパティを表示する場合は TRUE。pList で指定されたプロパティのみを表示する場合は FALSE。
%inst
セーブダイアログで収集されるプロパティを指定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
呼び出し側アプリケーションは PSGetPropertyDescriptionListFromString
関数を使って「prop:Comments;Subject;」のような文字列から IPropertyDescriptionList
を構築できる。プロパティスキーマの詳細については Property Schemas
を参照。IFileSaveDialog::SetCollectedProperties
はダイアログが表示される前、および表示中ならいつでも呼び出せる。選択されたファイルタイプに応じて異なるプロパティを収集したい場合は、OnTypeChange
に応じて IFileSaveDialog::SetCollectedProperties を呼び出せる。注意
既定では、セーブダイアログでプロパティは収集されない。


%index
IFileSaveDialog_GetProperties
保存済みアイテムまたは保存処理中のアイテムのプロパティ値のセットを取得する。
%group
COM misc / IFileSaveDialog
%prm
this, ppStore
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
ppStore : [comobj] 型: IPropertyStore** プロパティ値を受け取る IPropertyStore へのポインターのアドレス。
%inst
保存済みアイテムまたは保存処理中のアイテムのプロパティ値のセットを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

このメソッドはダイアログ表示中に呼び出して、メタデータ収集ペインの現在の値のセットを取得できる。ダイアログが閉じられた後にも呼び出して最終的な値のセットを取得できる。IFileSaveDialog::SetCollectedProperties
の呼び出しによってプロパティ収集が有効化されていない限り、このメソッドの呼び出しは失敗する。


%index
IFileSaveDialog_ApplyProperties
シェルのコピーエンジンを使って一連のプロパティをアイテムに適用する。
%group
COM misc / IFileSaveDialog
%prm
this, psi, pStore, hwnd, pSink
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
psi : [comobj] 型: IShellItem* 保存されるファイルを表す IShellItem へのポインター。通常これは GetResult で取得したアイテムである。
pStore : [comobj] 型: IPropertyStore* ファイルに適用されるプロパティ値を表す IPropertyStore へのポインター。これは IFileSaveDialog::GetProperties が返したプロパティストアでもよい。
hwnd : [intptr] 型: HWND アプリケーションウィンドウのハンドル。
pSink : [comobj] 型: IFileOperationProgressSink* 呼び出し側アプリケーションがプロパティの書き込み進捗の通知を受けたい場合に使用できる任意の IFileOperationProgressSink へのポインター。この値は NULL でもよい。
%inst
シェルのコピーエンジンを使って一連のプロパティをアイテムに適用する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

このメソッドは、アプリケーションがプロパティ収集を有効にしている（IFileSaveDialog::SetCollectedProperties）が、プロパティ自体を保存済みファイルに永続化していない場合に使用すべきである。注意
psi で指定したアイテムが表すファイルは、IFileSaveDialog::ApplyProperties
の呼び出し前に物理ストレージ上に存在していなければならない。つまり事前にどこかで保存されている必要がある。


%index
IModalWindow_Show
モーダルウィンドウを起動する。
%group
COM misc / IModalWindow
%prm
this, hwndOwner
this : [comobj] IModalWindow インターフェースの COM オブジェクト変数
hwndOwner : [intptr] 型: HWND オーナーウィンドウのハンドル。この値は NULL でもよい。
%inst
モーダルウィンドウを起動する。

[戻り値]
型: HRESULT メソッドが成功した場合 S_OK を返す。そうでなければ以下を含む HRESULT エラーコードを返す。
（以下省略）


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
オブジェクトのクラス識別子 (CLSID) を取得する。
%group
COM misc / IPersist
%prm
this, pClassID
this : [comobj] IPersist インターフェースの COM オブジェクト変数
pClassID : [var] 戻り時に CLSID を受け取る場所へのポインター。CLSID はグローバル一意識別子 (GUID) であり、オブジェクトデータを操作するコードを定義するオブジェクトクラスを一意に表す。
%inst
オブジェクトのクラス識別子 (CLSID) を取得する。

[戻り値]
メソッドが成功した場合、戻り値は S_OK。そうでなければ E_FAIL。

[備考]
GetClassID メソッドはオブジェクトのクラス識別子 (CLSID)
を取得する。これは後の操作でオブジェクト固有のコードを呼び出し側のコンテキストにロードするために使われる。呼び出し側へのメモ
コンテナーアプリケーションは、あるクラスを別のクラスとして扱っているオブジェクトの元の CLSID
を取得するためにこのメソッドを呼び出すことがある。このような呼び出しは、ユーザーがオブジェクトの保存を必要とする編集操作を行ったときに必要になる。コンテナーが
treat-as CLSID
で保存した場合、元のアプリケーションはオブジェクトを編集できなくなる。通常このような場合、コンテナーは必要なステップをすべて実行する
OleSave
ヘルパー関数を呼び出す。そのため、このメソッドを直接呼び出す必要のあるコンテナーアプリケーションはほとんどない。例外は特定のオブジェクトに対してオブジェクトハンドラーを提供するコンテナーである。特に、コンテナーアプリケーションはオブジェクトの
CLSID を取得してそれを使ってレジストリからクラス固有の情報を取得するべきではない。代わりに IOleObject および
IDataObject インターフェースを使用して、オブジェクトから直接クラス固有の情報を取得すべきである。実装者へのメモ
通常このメソッドの実装はオブジェクトに対する定数 CLSID を単に提供する。ただしオブジェクトの TreatAs
レジストリキーがエミュレーションをサポートするアプリケーションによって設定されている（つまりオブジェクトを別クラスのものとして扱っている）場合、GetClassID
の呼び出しは TreatAs キーで指定された CLSID を提供しなければならない。エミュレーションの詳細については
CoTreatAsClass を参照。オブジェクトが実行状態にあるとき、既定ハンドラーは GetClassID
の実装を呼び出し、それをオブジェクト内の実装に委譲する。オブジェクトが実行中でないとき、既定ハンドラーは代わりに ReadClassStg
関数を呼び出してオブジェクトのストレージに保存された CLSID
を読み取る。オブジェクト用のカスタムハンドラーを書く場合、このメソッドを既定ハンドラーの実装に単純に委譲したいこともあるだろう（OleCreateDefaultHandler
を参照）。
URL モニカに関する注意 このメソッドは CLSID_StdURLMoniker を返す。


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
オブジェクトが最後に現在のファイルに保存されて以来変更されたかどうかを判定する。
%group
COM misc / IPersistFile
%prm
this
this : [comobj] IPersistFile インターフェースの COM オブジェクト変数
%inst
オブジェクトが最後に現在のファイルに保存されて以来変更されたかどうかを判定する。

[戻り値]
オブジェクトが変更されたことを示すには S_OK を返す。そうでなければ S_FALSE を返す。

[備考]
このメソッドはオブジェクトを閉じる前に保存する必要があるかどうかを判定するのに使用する。オブジェクトのダーティフラグは
IPersistFile::Save メソッド内で条件付きでクリアされる。呼び出し側へのメモ OLE は IsDirty
を呼び出さない。アプリケーションがオブジェクトをファイルに保存している場合を除いて、これを呼び出すことはない。エラー戻りコードはオブジェクトが変更されたことの指標として扱うべきである。このメソッドが明示的に
S_FALSE を返さない限り、オブジェクトは保存が必要と想定するべきである。実装者へのメモ
内包オブジェクトを持たないオブジェクトは、単に自身のダーティフラグを確認して適切な結果を返せばよい。1
つ以上の内包オブジェクトを持つコンテナーは、最後に保存されて以来いずれかの内包オブジェクトが変更されたときに設定される内部ダーティフラグを保持しなければならない。そのためにコンテナーは
IAdviseSink インターフェースを実装してアドバイスシンクを保持するべきである。次にコンテナーはデータ変更通知のために
IDataObject::DAdvise を呼び出して各リンクまたは埋め込みを登録できる。こうするとコンテナーは
IAdviseSink::OnDataChange
通知を受け取ったときに内部ダーティフラグを設定できる。コンテナーがデータ変更通知を登録しない場合、IPersistFile::IsDirty
の実装は各内包オブジェクトに対して IPersistStorage::IsDirty
を呼び出して変更されたかどうかを判定する。コンテナーは保存するたびにダーティフラグをクリアできる。ただしオブジェクトが保存されたファイルが保存後に現在の作業ファイルであり続ける場合に限る。したがってダーティフラグは成功した保存または名前を付けて保存操作後にはクリアされるが、「コピーを別名で保存...」操作後にはクリアされない。


%index
IPersistFile_Load
指定したファイルを開き、その内容からオブジェクトを初期化する。
%group
COM misc / IPersistFile
%prm
this, pszFileName, dwMode
this : [comobj] IPersistFile インターフェースの COM オブジェクト変数
pszFileName : [wstr] 開くファイルの絶対パス。
dwMode : [int] ファイルを開くときに使用するアクセスモード。取り得る値は STGM 列挙子から来る。必要に応じてより制限的なアクセス権を追加してよいため、メソッドはこの値を提案として扱える。dwMode が 0 の場合、実装はユーザーがファイルを開くときに使われる既定のアクセス権で開くべきである。
%inst
指定したファイルを開き、その内容からオブジェクトを初期化する。

[戻り値]
このメソッドは以下の値を返すことがある。
（以下省略）

[備考]
IPersistFile::Load
は指定されたファイルからオブジェクトを読み込む。このメソッドは初期化のみ行い、エンドユーザーにオブジェクトを表示するわけではない。ユーザーが
[ファイルを開く] コマンドを選択したときに行われることとは等価ではない。呼び出し側へのメモ ファイルモニカの BindToObject
メソッドは、モニカのバインド操作中（リンクされたオブジェクトが実行されるとき）にオブジェクトを読み込むためにこのメソッドを呼び出す。通常、アプリケーションがこのメソッドを直接呼び出すことはない。実装者へのメモ
ファイルを開くのに必要な情報はアプリケーションによって大きく異なるため、このメソッドを実装するオブジェクト自身が pszFileName
パラメーターで指定されたファイルを開かなければならない。これは IPersistStorage::Load および
IPersistStream::Load
と異なる。それらでは呼び出し側がストレージやストリームを開き、開かれたストレージまたはストリームポインターをロードされたオブジェクトに渡す。通常
OLE 複合ファイルを使用するアプリケーションの場合、IPersistFile::Load の実装は単に StgOpenStorage
関数を呼び出して指定されたファイル内のストレージオブジェクトを開けばよい。その後通常の初期化を進められる。ストレージオブジェクトを使用しないアプリケーションは通常のファイルを開く手順を実行できる。オブジェクトが読み込まれたら、実装はオブジェクトをランニングオブジェクトテーブルに登録するべきである（IRunningObjectTable::Register
を参照）。


%index
IPersistFile_Save
オブジェクトのコピーを指定したファイルに保存する。
%group
COM misc / IPersistFile
%prm
this, pszFileName, fRemember
this : [comobj] IPersistFile インターフェースの COM オブジェクト変数
pszFileName : [wstr] オブジェクトが保存されるファイルの絶対パス。pszFileName が NULL の場合、オブジェクトは現在のファイル（存在する場合）にデータを保存するべきである。
fRemember : [int] pszFileName パラメーターを現在の作業ファイルとして使用するかどうかを示す。TRUE の場合、pszFileName が現在のファイルとなり、オブジェクトは保存後にダーティフラグをクリアするべきである。FALSE の場合、この保存操作は「コピーを別名で保存...」操作である。この場合、現在のファイルは変更されず、オブジェクトはダーティフラグをクリアするべきでない。pszFileName が NULL の場合、実装は fRemember フラグを無視するべきである。
%inst
オブジェクトのコピーを指定したファイルに保存する。

[戻り値]
オブジェクトが正常に保存された場合、戻り値は S_OK。そうでなければ
S_FALSE。このメソッドはさまざまなストレージエラーを返すこともある。

[備考]
このメソッドは 3 通りの方法で指定したファイルにオブジェクトを保存するために呼び出せる。
実装者は呼び出し側が要求している保存操作の種類を判断しなければならない。pszFileName パラメーターが NULL の場合は
Save が要求されている。pszFileName パラメーターが NULL でない場合、fRemember パラメーターの値を使って
Save As と Save a Copy As を区別する。Save または Save As
操作では、IPersistFile::Save は保存後に内部ダーティフラグをクリアし、任意のアドバイザリ接続に
IAdviseSink::OnSave 通知を送る（IOleAdviseHolder::SendOnSave
も参照）。また、これらの操作ではオブジェクトは IPersistFile::SaveCompleted 呼び出しを受け取るまで
NoScribble モードになる。NoScribble モードではオブジェクトはファイルに書き込んではならない。Save As
シナリオでは、実装は任意のアドバイザリ接続に IAdviseSink::OnRename
通知を送るべきである（IOleAdviseHolder::SendOnRename も参照）。Save a Copy As
シナリオでは、実装は保存後に内部ダーティフラグをクリアしない。呼び出し側へのメモ OLE は IPersistFile::Save
を呼び出さない。通常、アプリケーションはオブジェクトを直接ファイルに保存している場合を除いてこれを呼び出さない。それは一般にエンドユーザーに任されている。


%index
IPersistFile_SaveCompleted
オブジェクトに自身のファイルへ書き込み可能であることを通知する。
%group
COM misc / IPersistFile
%prm
this, pszFileName
this : [comobj] IPersistFile インターフェースの COM オブジェクト変数
pszFileName : [wstr] 以前にオブジェクトが保存されたファイルの絶対パス。
%inst
オブジェクトに自身のファイルへ書き込み可能であることを通知する。

[戻り値]
このメソッドは常に S_OK を返す。

[備考]
SaveCompleted は IPersistFile::Save
の呼び出しが完了し、保存されたファイルが現在の作業ファイルになったとき（Save または Save As
操作で保存された場合）に呼び出される。Save の呼び出しによりオブジェクトは NoScribble
モードに置かれ、ファイルに書き込めない。SaveCompleted
が呼び出されるとオブジェクトは通常モードに戻り、ファイルへの書き込みが可能になる。呼び出し側へのメモ OLE は
SaveCompleted
メソッドを呼び出さない。通常、アプリケーションはオブジェクトを直接ファイルに保存している場合を除いてこれを呼び出さない。それは一般にエンドユーザーに任されている。


%index
IPersistFile_GetCurFile
オブジェクトに関連付けられたファイルの現在の名前を取得する。現在の作業ファイルがない場合は、オブジェクトの既定の保存プロンプトを取得する。
%group
COM misc / IPersistFile
%prm
this, ppszFileName
this : [comobj] IPersistFile インターフェースの COM オブジェクト変数
ppszFileName : [var] 現在のファイルのパス、または既定のファイル名プロンプト（例えば *.txt）。エラーが発生した場合 ppszFileName は NULL に設定される。
%inst
オブジェクトに関連付けられたファイルの現在の名前を取得する。現在の作業ファイルがない場合は、オブジェクトの既定の保存プロンプトを取得する。

[戻り値]
このメソッドは以下の値を返すことがある。
（以下省略）

[備考]
このメソッドは ppszFileName パラメーターで返される文字列のメモリを IMalloc::Alloc
メソッドを使って確保する。呼び出し側は IMalloc::Free
メソッドを呼び出して文字列を解放する責任がある。呼び出し側とこのメソッドの双方は CoGetMalloc の呼び出しで取得できる OLE
タスクアロケーターを使用する。ppszFileName で返されるファイル名は、ドキュメントがロードされたときに
IPersistFile::Load の呼び出しで指定されたものである。あるいはドキュメントが別のファイルに保存された場合は
IPersistFile::SaveCompleted
で指定されたものである。オブジェクトに現在の作業ファイルがない場合は、[名前を付けて保存]
ダイアログボックスに表示する既定のプロンプトを提供すべきである。例えばワードプロセッサオブジェクトの既定の保存プロンプトは「*.txt」などになる。呼び出し側へのメモ
OLE は GetCurFile
メソッドを呼び出さない。アプリケーションがこのインターフェースの保存メソッドも呼び出している場合を除いて、このメソッドを呼び出すことはない。オブジェクトを保存する際、IPersistFile::Save
を呼び出す前にこのメソッドを呼び出して、オブジェクトに関連付けられたファイルがあるかどうかを判定できる。このメソッドが S_OK
を返した場合、IPersistFile::Save を filename が NULL かつ fRemember パラメーターが TRUE
で呼び出して、オブジェクトに現在のファイルに自身を保存するよう指示できる。このメソッドが S_FALSE を返した場合は
ppszFileName
パラメーターで返された保存プロンプトを使ってエンドユーザーにファイル名の提供を求め、ユーザーが入力したファイル名を指定して
IPersistFile::Save を呼び出して名前を付けて保存操作を行える。


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
IPropertyBag2_Read
IPropertyBag2::Read (vtable slot 3)
%group
COM misc / IPropertyBag2
%prm
this, cProperties, pPropBag, pErrLog, pvarValue, phrError
this : [comobj] IPropertyBag2 インターフェースの COM オブジェクト変数
cProperties : [int] 
pPropBag : [var] 
pErrLog : [comobj] 
pvarValue : [int] 
phrError : [var] 
%inst


%index
IPropertyBag2_Write
IPropertyBag2::Write (vtable slot 4)
%group
COM misc / IPropertyBag2
%prm
this, cProperties, pPropBag, pvarValue
this : [comobj] IPropertyBag2 インターフェースの COM オブジェクト変数
cProperties : [int] 
pPropBag : [var] 
pvarValue : [int] 
%inst


%index
IPropertyBag2_CountProperties
IPropertyBag2::CountProperties (vtable slot 5)
%group
COM misc / IPropertyBag2
%prm
this, pcProperties
this : [comobj] IPropertyBag2 インターフェースの COM オブジェクト変数
pcProperties : [int] 
%inst


%index
IPropertyBag2_GetPropertyInfo
IPropertyBag2::GetPropertyInfo (vtable slot 6)
%group
COM misc / IPropertyBag2
%prm
this, iProperty, cProperties, pPropBag, pcProperties
this : [comobj] IPropertyBag2 インターフェースの COM オブジェクト変数
iProperty : [int] 
cProperties : [int] 
pPropBag : [var] 
pcProperties : [int] 
%inst


%index
IPropertyBag2_LoadObject
IPropertyBag2::LoadObject (vtable slot 7)
%group
COM misc / IPropertyBag2
%prm
this, pstrName, dwHint, pUnkObject, pErrLog
this : [comobj] IPropertyBag2 インターフェースの COM オブジェクト変数
pstrName : [wstr] 
dwHint : [int] 
pUnkObject : [int] 
pErrLog : [comobj] 
%inst


%index
IPropertyDescriptionList_GetCount
プロパティリストに含まれるプロパティの数を取得する。
%group
COM misc / IPropertyDescriptionList
%prm
this, pcElem
this : [comobj] IPropertyDescriptionList インターフェースの COM オブジェクト変数
pcElem : [int] 型: UINT* このメソッドが戻ると、プロパティ数へのポインターが格納される。
%inst
プロパティリストに含まれるプロパティの数を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IPropertyDescriptionList_GetAt
プロパティ記述リスト内の指定したインデックスのプロパティ記述を取得する。
%group
COM misc / IPropertyDescriptionList
%prm
this, iElem, riid, ppv
this : [comobj] IPropertyDescriptionList インターフェースの COM オブジェクト変数
iElem : [int] 型: UINT リスト文字列内のプロパティの番号。
riid : [var] 型: REFIID 要求するプロパティ記述インターフェースの IID への参照。通常は IID_IPropertyDescription。
ppv : [int] 型: void** このメソッドが戻ると、riid で要求されたインターフェースポインターが格納される。通常これは IPropertyDescription。
%inst
プロパティ記述リスト内の指定したインデックスのプロパティ記述を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
riid と ppv のパラメーターをまとめるには objbase.h で定義された IID_PPV_ARGS
マクロを使うことが推奨される。このマクロは ppv が指すインターフェースに基づいて正しい IID
を提供するため、コーディングミスの可能性を排除できる。


%index
IPropertyStore_GetCount
ファイルに付与されているプロパティの数を返す。
%group
COM misc / IPropertyStore
%prm
this, cProps
this : [comobj] IPropertyStore インターフェースの COM オブジェクト変数
cProps : [int] プロパティ数を示す値へのポインター。
%inst
ファイルに付与されているプロパティの数を返す。

[戻り値]
IPropertyStore::GetCount メソッドは成功時、ファイルにプロパティが 1 つも付与されていない場合でも S_OK
を返す。その他のコードはエラーコードである。

[備考]
IPropertyStore は IPropertyStore::GetCount および IPropertyStore::GetAt
メソッド経由でプロパティキーの配列に対する抽象化を提供する。この配列内のプロパティキーは、IPropertyStore
が現在格納しているプロパティを表す。GetCount が成功した場合、cProps
が指す値は配列内のプロパティキーの個数である。呼び出し側は iProp が cProps より小さい値に対する
IPropertyStore::GetAt の呼び出しが成功することを期待できる。E_OUTOFMEMORY
などの失敗の場合は、cProps を 0 に設定するべきである。エラーはプロパティストアの作成時または初期化時に検出することが望ましい。


%index
IPropertyStore_GetAt
アイテムのプロパティ配列からプロパティキーを取得する。
%group
COM misc / IPropertyStore
%prm
this, iProp, pkey
this : [comobj] IPropertyStore インターフェースの COM オブジェクト変数
iProp : [int] PROPERTYKEY 構造体の配列内のプロパティキーのインデックス。これは 0 ベースのインデックスである。
pkey : [var] TBD
%inst
アイテムのプロパティ配列からプロパティキーを取得する。

[戻り値]
IPropertyStore::GetAt メソッドは成功時に S_OK を返す。その他のコードはエラーコードとみなす必要がある。

[備考]
なし


%index
IPropertyStore_GetValue
特定のプロパティのデータを取得する。
%group
COM misc / IPropertyStore
%prm
this, key, pv
this : [comobj] IPropertyStore インターフェースの COM オブジェクト変数
key : [var] TBD
pv : [int] IPropertyStore::GetValue メソッドが正常に戻った後、このパラメーターはプロパティに関するデータを含む PROPVARIANT 構造体を指す。
%inst
特定のプロパティのデータを取得する。

[戻り値]
成功した場合は S_OK または INPLACE_S_TRUNCATED
を返す。そうでなければエラー値を返す。INPLACE_S_TRUNCATED は返された PROPVARIANT
がより正準な形式に変換されたことを示す。例えば文字列値の前後の空白をトリミングした場合などである。戻り値を確認するには
INPLACE_S_TRUNCATED を成功コードとして扱う SUCCEEDED マクロを使用しなければならない。SUCCEEDED
マクロは Winerror.h で定義されている。

[備考]
key で参照される PROPERTYKEY がプロパティストアに存在しない場合、このメソッドは S_OK を返し、pv が指す構造体の
vt メンバーは VT_EMPTY に設定される。


%index
IPropertyStore_SetValue
プロパティ値を設定するか、既存の値を置き換えるか、または削除する。
%group
COM misc / IPropertyStore
%prm
this, key, propvar
this : [comobj] IPropertyStore インターフェースの COM オブジェクト変数
key : [var] TBD
propvar : [int] TBD
%inst
プロパティ値を設定するか、既存の値を置き換えるか、または削除する。

[戻り値]
IPropertyStore::SetValue メソッドは以下のいずれかを返すことがある。
（以下省略）

[備考]
IPropertyStore::SetValue
は現在のプロパティストアインスタンスにのみ影響する。プロパティハンドラーはプロパティ変更をメモリ内のデータ構造に蓄積することで
IPropertyStore::SetValue を実装する。プロパティ変更は IPropertyStore::Commit
が呼び出されたときにのみストリームに書き込まれる。読み取り専用のプロパティストアで IPropertyStore::Commit
が呼び出された場合、プロパティハンドラーはそれを検知して STG_E_ACCESSDENIED を返す。SetValue
の結果として値が追加または削除された場合、以降の IPropertyStore::GetCount および
IPropertyStore::GetAt による列挙はその変更を反映し、以降の IPropertyStore::SetValue
の呼び出しは変更後の値を反映する。新しいプロパティの追加 key
が指すプロパティ値がストアに存在しない場合、IPropertyStore::SetValue
はその値をストアに追加する。既存のプロパティ値の置換 key
が指すプロパティ値が既にストアに存在する場合、格納されている値は置き換えられる。既存のプロパティの削除
プロパティストアから値を削除するには、pv が指す構造体の vt メンバーを VT_EMPTY
に設定する。その値が存在しない場合は何もせず、メソッドは S_OK を返す。


%index
IPropertyStore_Commit
変更が行われた後に、その変更を保存する。
%group
COM misc / IPropertyStore
%prm
this
this : [comobj] IPropertyStore インターフェースの COM オブジェクト変数
%inst
変更が行われた後に、その変更を保存する。

[戻り値]
IPropertyStore::Commit メソッドは以下のいずれかを返す。
（以下省略）

[備考]
Commit
メソッドが戻る前に、このメソッドで使用するために初期化されていたファイルストリームまたはパスを解放する。そのため、Commit
が戻った後は IPropertyStore のメソッドは成功しなくなり、E_FAIL を返す。プロパティハンドラーは、Commit
プロセスが異常終了したりエラーに遭遇したりしても、プロパティ変更が有効な出力先ファイルに反映されるよう保証しなければならない。


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
ハンドラー ID (BHID) で指定したアイテム用のハンドラーにバインドする。
%group
COM misc / IShellItem
%prm
this, pbc, bhid, riid, ppv
this : [comobj] IShellItem インターフェースの COM オブジェクト変数
pbc : [comobj] 型: IBindCtx* バインドコンテキストオブジェクト上の IBindCtx インターフェースへのポインター。オプションのパラメーターをハンドラーに渡すのに使用する。バインドコンテキストの内容はハンドラー固有である。例えば BHID_Stream へバインドする際、バインドコンテキストの STGM フラグは望むアクセスモード（read または read/write）を示す。
bhid : [var] 型: REFGUID
riid : [var] 型: REFIID 取得するオブジェクト型の IID。
ppv : [int] 型: void** このメソッドが戻ると、rbhid で指定されたハンドラーが返す riid 型のポインターを含む。
%inst
ハンドラー ID (BHID) で指定したアイテム用のハンドラーにバインドする。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IShellItem_GetParent
IShellItem オブジェクトの親を取得する。
%group
COM misc / IShellItem
%prm
this, ppsi
this : [comobj] IShellItem インターフェースの COM オブジェクト変数
ppsi : [comobj] 型: IShellItem** IShellItem インターフェースの親へのポインターのアドレス。
%inst
IShellItem オブジェクトの親を取得する。

[戻り値]
型: HRESULT 成功した場合は S_OK、そうでなければエラー値を返す。


%index
IShellItem_GetDisplayName
IShellItem オブジェクトの表示名を取得する。
%group
COM misc / IShellItem
%prm
this, sigdnName, ppszName
this : [comobj] IShellItem インターフェースの COM オブジェクト変数
sigdnName : [int] 型: SIGDN 名前の見た目を示す SIGDN 値の 1 つ。
ppszName : [var] 型: LPWSTR* この関数が正常に戻ったときに、取得した表示名へのポインターのアドレスを受け取る値。
%inst
IShellItem オブジェクトの表示名を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
ppszName が指す文字列は不要になったら呼び出し側が解放する責任を負う。メモリを解放するには *ppszName に対して
CoTaskMemFree を呼び出す。


%index
IShellItem_GetAttributes
IShellItem オブジェクトの、要求された属性のセットを取得する。
%group
COM misc / IShellItem
%prm
this, sfgaoMask, psfgaoAttribs
this : [comobj] IShellItem インターフェースの COM オブジェクト変数
sfgaoMask : [int] 型: SFGAOF 取得する属性を指定する。SFGAO 値の 1 つ以上の組み合わせ。取得する属性を決定するにはビット単位の OR 演算子を使用する。
psfgaoAttribs : [var] 型: SFGAOF* このメソッドが正常に戻ったときに要求された属性を受け取る値へのポインター。SFGAO 値の 1 つ以上の組み合わせ。sfgaoMask で指定された属性のみが返され、その他の属性値は未定義である。
%inst
IShellItem オブジェクトの、要求された属性のセットを取得する。

[戻り値]
型: HRESULT 返された属性が sfgaoMask で要求されたものと完全に一致する場合は S_OK、完全に一致しない場合は
S_FALSE、そうでなければ標準 COM エラー値を返す。


%index
IShellItem_Compare
2 つの IShellItem オブジェクトを比較する。
%group
COM misc / IShellItem
%prm
this, psi, hint, piOrder
this : [comobj] IShellItem インターフェースの COM オブジェクト変数
psi : [comobj] 型: IShellItem* 既存の IShellItem オブジェクトと比較する IShellItem オブジェクトへのポインター。
hint : [int] 型: SICHINTF 比較方法を決定する SICHINTF 値の 1 つ。このパラメーターが取り得る値は SICHINTF を参照。
piOrder : [int] 型: int* 比較結果を受け取るパラメーター。2 つのアイテムが同じ場合は 0、異なる場合は 0 以外になる。
%inst
2 つの IShellItem オブジェクトを比較する。

[戻り値]
型: HRESULT アイテムが同じ場合は S_OK、異なる場合は S_FALSE、そうでなければエラー値を返す。

[備考]
2 番目のパラメーターで使用するデータ型 SICHINTF は次のように定義される。
（以下省略)


%index
IShellItemArray_BindToHandler
指定したハンドラーを介してオブジェクトにバインドする。
%group
COM misc / IShellItemArray
%prm
this, pbc, bhid, riid, ppvOut
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
pbc : [comobj] 型: IBindCtx* バインドコンテキストオブジェクト上の IBindCtx インターフェースへのポインター。
bhid : [var] 型: REFGUID
riid : [var] 型: REFIID 取得するオブジェクト型の IID。
ppvOut : [int] 型: void** このメソッドが戻ると、rbhid で指定されたハンドラーが返す、riid で指定したオブジェクトを含む。
%inst
指定したハンドラーを介してオブジェクトにバインドする。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IShellItemArray_GetPropertyStore
プロパティストアを取得する。
%group
COM misc / IShellItemArray
%prm
this, flags, riid, ppv
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
flags : [int] 型: GETPROPERTYSTOREFLAGS GETPROPERTYSTOREFLAGS 定数の 1 つ。
riid : [var] 型: REFIID 取得するオブジェクト型の IID。
ppv : [int] 型: void** このメソッドが戻ると、riid で要求されたインターフェースポインターを含む。通常これは IPropertyStore または IPropertyStoreCapabilities。
%inst
プロパティストアを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

このメソッドは、シェルアイテム配列内のすべてのアイテムから集約したプロパティを提供する読み取り専用のプロパティストアを取得するのに使用する。シェルアイテム配列に複数のアイテムがある場合、結果のプロパティストアは各プロパティごとに決まるルールに従って各アイテムの値を集約する。プロパティストアから読み取られた値は、CoerceToCanonicalValue
で説明されているとおり、集約前に正準形式に強制変換される。IPropertyStore::GetValue
の呼び出しからの出力は以下のように算出される。
（以下省略）


%index
IShellItemArray_GetPropertyDescriptionList
シェルアイテム配列内のアイテムのプロパティ記述リストを取得する。
%group
COM misc / IShellItemArray
%prm
this, keyType, riid, ppv
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
keyType : [var] 型: REFPROPERTYKEY 取得するプロパティリストを指定する PROPERTYKEY 構造体への参照。
riid : [var] 型: REFIID 取得するオブジェクト型の IID。
ppv : [int] 型: void** このメソッドが戻ると、riid で要求されたインターフェースを含む。通常これは IPropertyDescriptionList。
%inst
シェルアイテム配列内のアイテムのプロパティ記述リストを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
この関数は一連のシェルアイテムに適用可能なプロパティのリストを決定するのに使用する。リストの型は PROPERTYKEY
構造体で指定する。サポートされるリスト型には以下のものが含まれる（ただしこれに限らない）。
（以下省略）


%index
IShellItemArray_GetAttributes
IShellItemArray に含まれるアイテムのセットの属性を取得する。
%group
COM misc / IShellItemArray
%prm
this, AttribFlags, sfgaoMask, psfgaoAttribs
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
AttribFlags : [int] 型: SIATTRIBFLAGS
sfgaoMask : [int] 型: SFGAOF 要求する特定の属性を指定するマスク。1 つ以上の SFGAO 値のビット単位 OR。
psfgaoAttribs : [var] 型: SFGAOF* このメソッドが正常に戻ったときに、要求された属性の値を含むビットマップ。
%inst
IShellItemArray に含まれるアイテムのセットの属性を取得する。

[戻り値]
型: HRESULT 返された属性が sfgaoMask で要求されたものと完全に一致する場合は S_OK、完全に一致しない場合は
S_FALSE、そうでなければ標準 COM エラー値を返す。

[備考]

シェルアイテム配列は個々の属性が決定された後にそれらをキャッシュする。このメソッドが属性情報を収集するために配列を走査する際、通常はある属性の値が不可逆的に決定された時点でその属性の調査を停止する。例えば
SIATTRIBFLAGS_AND フラグが設定されている場合、あるアイテムで属性が設定されていない（値が 0）と判明した時点で、AND
演算の結果は必ず 0
となるため、その属性について他のアイテムを調べ続ける必要がなくなる。したがって、最終的な属性セットは配列内の最初の数アイテムのみを調べて算出されることが多く、最終値を取得するために必要なのはそれだけである。配列内のすべてのアイテムを調べる必要がある場合は
SIATTRIBFLAGS_ALLITEMS
フラグを設定する。ただしこれはメソッドの戻りを大きく遅くする可能性があるため、理由なく使用してはならない。


%index
IShellItemArray_GetCount
指定した IShellItem 配列内のアイテム数を取得する。
%group
COM misc / IShellItemArray
%prm
this, pdwNumItems
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
pdwNumItems : [int] 型: DWORD* このメソッドが戻ると、IShellItemArray 内のアイテム数を含む。
%inst
指定した IShellItem 配列内のアイテム数を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IShellItemArray_GetItemAt
IShellItemArray 内の指定したインデックスのアイテムを取得する。
%group
COM misc / IShellItemArray
%prm
this, dwIndex, ppsi
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
dwIndex : [int] 型: DWORD IShellItemArray 内で要求する IShellItem のインデックス。
ppsi : [comobj] 型: IShellItem** このメソッドが戻ると、要求された IShellItem ポインターを含む。
%inst
IShellItemArray 内の指定したインデックスのアイテムを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
要求されたインデックスが IShellItemArray の範囲外の場合、この関数は E_FAIL を返す。


%index
IShellItemArray_EnumItems
配列内のアイテムの列挙子を取得する。
%group
COM misc / IShellItemArray
%prm
this, ppenumShellItems
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
ppenumShellItems : [comobj] 型: IEnumShellItems** このメソッドが戻ると、配列内のシェルアイテムを列挙する IEnumShellItems ポインターを含む。
%inst
配列内のアイテムの列挙子を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IShellItemFilter_IncludeItem
指定したシェルアイテムをビューへの含有対象として設定する。
%group
COM misc / IShellItemFilter
%prm
this, psi
this : [comobj] IShellItemFilter インターフェースの COM オブジェクト変数
psi : [comobj] 型: IShellItem* ビューに含めるシェルアイテムへのポインター。
%inst
指定したシェルアイテムをビューへの含有対象として設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
ホストはフォルダー内の各アイテムに対してこのメソッドを呼び出す。アイテムをビューに含めるために列挙する場合は S_OK
を返す。ビューに含めないようにするには S_FALSE を返す。


%index
IShellItemFilter_GetEnumFlagsForItem
クライアントがシェルアイテム内のどのクラスのオブジェクトをビューに含めるために列挙するかを指定できるようにする。
%group
COM misc / IShellItemFilter
%prm
this, psi, pgrfFlags
this : [comobj] IShellItemFilter インターフェースの COM オブジェクト変数
psi : [comobj] 型: IShellItem* SHCONTF 列挙フラグを取得するシェルアイテムへのポインター。
pgrfFlags : [int] 型: SHCONTF* 指定したシェルアイテムについて、ビューへ含めるために列挙するオブジェクトのクラスを指定する SHCONTF 列挙フラグへのポインター。
%inst
クライアントがシェルアイテム内のどのクラスのオブジェクトをビューに含めるために列挙するかを指定できるようにする。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IShellLinkW_GetPath
シェルリンクオブジェクトのターゲットのパスとファイル名を取得する。(Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszFile, cch, pfd, fFlags
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszFile : [wstr] 型: LPTSTR シェルリンクオブジェクトのターゲットのパスとファイル名を受け取るバッファのアドレス。
cch : [int] 型: int pszFile パラメーターが指すバッファのサイズ（文字数）。終端 null 文字を含む。返される最大パスサイズは MAX_PATH。このパラメーターは一般に ARRAYSIZE(pszFile) を呼び出すことで設定される。ARRAYSIZE マクロは Winnt.h で定義されている。
pfd : [var] 型: WIN32_FIND_DATA* シェルリンクオブジェクトのターゲットに関する情報を受け取る WIN32_FIND_DATA 構造体へのポインター。このパラメーターが NULL の場合、追加情報は返されない。
fFlags : [int] 型: DWORD
%inst
シェルリンクオブジェクトのターゲットのパスとファイル名を取得する。(Unicode)

[戻り値]
型: HRESULT 操作が成功し、有効なパスが取得できた場合は S_OK を返す。操作は成功したがパスが取得できなかった場合は
S_FALSE を返し、pszFile は空となる。そうでなければ標準 HRESULT エラー値のいずれかを返す。


%index
IShellLinkW_GetIDList
シェルリンクオブジェクトのターゲットのアイテム識別子リストを取得する。(Unicode)
%group
COM misc / IShellLinkW
%prm
this, ppidl
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
ppidl : [comobj] 型: PIDLIST_ABSOLUTE* このメソッドが戻ると PIDL のアドレスを含む。
%inst
シェルリンクオブジェクトのターゲットのアイテム識別子リストを取得する。(Unicode)

[戻り値]
型: HRESULT 操作が成功し、1 つ以上の有効な PIDL が取得できた場合は S_OK を返す。操作は成功したが PIDL
が取得できなかった場合は S_FALSE を返し、ppidl は NULL に設定される。そうでなければ標準のエラー値を返す。


%index
IShellLinkW_SetIDList
シェルリンクオブジェクトのアイテム識別子リスト (PIDL) へのポインターを設定する。(Unicode)
%group
COM misc / IShellLinkW
%prm
this, pidl
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pidl : [comobj] 型: PCIDLIST_ABSOLUTE オブジェクトの完全修飾 PIDL。
%inst
シェルリンクオブジェクトのアイテム識別子リスト (PIDL) へのポインターを設定する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

このメソッドは、コントロールパネルアプリケーション、プリンター、または別のコンピューターのようなファイルでないオブジェクトへのシェルリンクを設定する必要があるときに便利である。


%index
IShellLinkW_GetDescription
シェルリンクオブジェクトの説明文字列を取得する。(Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszName, cch
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszName : [wstr] 型: LPTSTR 説明文字列を受け取るバッファへのポインター。
cch : [int] 型: int pszName パラメーターが指すバッファにコピーする最大文字数。
%inst
シェルリンクオブジェクトの説明文字列を取得する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
Windows 2000 以降では pszName に返される文字列の最大長は INFOTIPSIZE である。Windows 2000
より前のシステムでは、文字列のサイズは MAX_PATH により制限される。


%index
IShellLinkW_SetDescription
シェルリンクオブジェクトの説明を設定する。説明はアプリケーションが定義する任意の文字列でよい。(Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszName
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszName : [wstr] 型: LPCTSTR 新しい説明文字列を含むバッファへのポインター。
%inst
シェルリンクオブジェクトの説明を設定する。説明はアプリケーションが定義する任意の文字列でよい。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
Windows 2000 以降では pszName で指定する文字列は INFOTIPSIZE 以下でなければならない。Windows
2000 より前のシステムでは、文字列のサイズは MAX_PATH により制限される。


%index
IShellLinkW_GetWorkingDirectory
シェルリンクオブジェクトの作業ディレクトリ名を取得する。(Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszDir, cch
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszDir : [wstr] 型: LPTSTR 作業ディレクトリ名を受け取るバッファのアドレス。
cch : [int] 型: int pszDir パラメーターが指すバッファにコピーする最大文字数。このパラメーターで指定した最大値より長い場合、作業ディレクトリ名は切り詰められる。
%inst
シェルリンクオブジェクトの作業ディレクトリ名を取得する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IShellLinkW_SetWorkingDirectory
シェルリンクオブジェクトの作業ディレクトリ名を設定する。(Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszDir
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszDir : [wstr] 型: LPCTSTR 新しい作業ディレクトリ名を含むバッファのアドレス。
%inst
シェルリンクオブジェクトの作業ディレクトリ名を設定する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

作業ディレクトリはターゲットが作業ディレクトリを必要としない限り省略可能である。例えば、アプリケーションが異なるディレクトリにあるテンプレートを使用する
Microsoft Word
ドキュメントへのシェルリンクを作成する場合、アプリケーションはこのメソッドを使って作業ディレクトリを設定する。


%index
IShellLinkW_GetArguments
シェルリンクオブジェクトに関連付けられたコマンドライン引数を取得する。(Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszArgs, cch
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszArgs : [wstr] 型: LPTSTR このメソッドが正常に戻ったときにコマンドライン引数を受け取るバッファへのポインター。
cch : [int] 型: int pszArgs パラメーターが提供するバッファにコピーできる最大文字数。Unicode 文字列の場合、文字列の最大長に制限はない。ANSI 文字列の場合、返される文字列の最大長は Windows のバージョンによって異なる。Windows 2000 より前は MAX_PATH、Windows 2000 以降は INFOTIPSIZE（Commctrl.h で定義）。
%inst
シェルリンクオブジェクトに関連付けられたコマンドライン引数を取得する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
Windows 7
以降では、提供されたバッファが十分な大きさでない場合にこのメソッドは黙って文字列を切り詰めることがあるため、このメソッドよりも
IPropertyStore 経由で（PKEY_Link_Arguments
値を使って）引数文字列を取得することが推奨される。IPropertyStore は適切なサイズの文字列を確保する。


%index
IShellLinkW_SetArguments
シェルリンクオブジェクトのコマンドライン引数を設定する。(Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszArgs
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszArgs : [wstr] 型: LPCTSTR 新しいコマンドライン引数を含むバッファへのポインター。Unicode 文字列の場合、文字列の最大長に制限はない。ANSI 文字列の場合、返される文字列の最大長は Windows のバージョンによって異なる。Windows 2000 より前は MAX_PATH、Windows 2000 以降は INFOTIPSIZE（Commctrl.h で定義）。
%inst
シェルリンクオブジェクトのコマンドライン引数を設定する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
このメソッドは、コンパイラーのように特別なフラグを引数として取るアプリケーションへのリンクを作成するときに便利である。


%index
IShellLinkW_GetHotkey
シェルリンクオブジェクトのキーボードショートカット（ホットキー）を取得する。(Unicode)
%group
COM misc / IShellLinkW
%prm
this, pwHotkey
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pwHotkey : [int] 型: WORD*
%inst
シェルリンクオブジェクトのキーボードショートカット（ホットキー）を取得する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IShellLinkW_SetHotkey
シェルリンクオブジェクトのキーボードショートカット（ホットキー）を設定する。(Unicode)
%group
COM misc / IShellLinkW
%prm
this, wHotkey
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
wHotkey : [int] 型: WORD 新しいキーボードショートカット。下位バイトに仮想キーコードが、上位バイトに修飾フラグが格納される。修飾フラグは IShellLink::GetHotkey メソッドの説明で指定された値の組み合わせでよい。
%inst
シェルリンクオブジェクトのキーボードショートカット（ホットキー）を設定する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
キーボードショートカットを設定すると、特定のキーの組み合わせを押すことでユーザーがオブジェクトをアクティブ化できるようになる。


%index
IShellLinkW_GetShowCmd
シェルリンクオブジェクトの表示コマンドを取得する。(Unicode)
%group
COM misc / IShellLinkW
%prm
this, piShowCmd
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
piShowCmd : [var] 型: int* コマンドへのポインター。以下のコマンドがサポートされる。
%inst
シェルリンクオブジェクトの表示コマンドを取得する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
表示コマンドは対応するオブジェクトの初期表示状態を設定するのに使用する。これは ShowWindow に記載されている SW_xxx 値の
1 つ。


%index
IShellLinkW_SetShowCmd
シェルリンクオブジェクトの表示コマンドを設定する。表示コマンドはウィンドウの初期表示状態を設定する。(Unicode)
%group
COM misc / IShellLinkW
%prm
this, iShowCmd
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
iShowCmd : [int] 型: int コマンド。SetShowCmd は以下の ShowWindow コマンドのいずれかを受け取る。
%inst
シェルリンクオブジェクトの表示コマンドを設定する。表示コマンドはウィンドウの初期表示状態を設定する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IShellLinkW_GetIconLocation
シェルリンクオブジェクトのアイコンの位置（パスとインデックス）を取得する。(Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszIconPath, cch, piIcon
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszIconPath : [wstr] 型: LPTSTR アイコンを含むファイルのパスを受け取るバッファのアドレス。
cch : [int] 型: int pszIconPath パラメーターが指すバッファにコピーする最大文字数。
piIcon : [int] 型: int* アイコンのインデックスを受け取る値のアドレス。
%inst
シェルリンクオブジェクトのアイコンの位置（パスとインデックス）を取得する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IShellLinkW_SetIconLocation
シェルリンクオブジェクトのアイコンの位置（パスとインデックス）を設定する。(Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszIconPath, iIcon
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszIconPath : [wstr] 型: LPCTSTR アイコンを含むファイルのパスを格納するバッファのアドレス。
iIcon : [int] 型: int アイコンのインデックス。
%inst
シェルリンクオブジェクトのアイコンの位置（パスとインデックス）を設定する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IShellLinkW_SetRelativePath
シェルリンクオブジェクトへの相対パスを設定する。(Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszPathRel, dwReserved
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszPathRel : [wstr] 型: LPCTSTR ショートカット解決の基準となるショートカットファイルの完全修飾パスを含むバッファのアドレス。フォルダー名ではなくファイル名でなければならない。
dwReserved : [int] 型: DWORD 予約済み。このパラメーターには 0 を設定する。
%inst
シェルリンクオブジェクトへの相対パスを設定する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

クライアントはリンクがターゲットとともに移動される可能性があり、絶対パスが無効になる場合に、相対リンクを定義することがある。SetRelativePath
メソッドは、ターゲットと相対パスとの間の共通のパスプレフィックスに基づいてリンク解決プロセスがターゲットを見つけるのを助けるのに使える。解決プロセスを支援するため、クライアントはリンク作成プロセスの一部として相対パスを設定するべきである。


%index
IShellLinkW_Resolve
シェルリンクのターゲットが移動または名前変更されていても、それを見つけようと試みる。(Unicode)
%group
COM misc / IShellLinkW
%prm
this, hwnd, fFlags
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
hwnd : [intptr] 型: HWND シェルがダイアログボックスの親として使用するウィンドウへのハンドル。シェルリンクの解決中に追加情報をユーザーに求める必要がある場合、シェルはダイアログボックスを表示する。
fFlags : [int] 型: DWORD
%inst
シェルリンクのターゲットが移動または名前変更されていても、それを見つけようと試みる。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
リンク作成後、ターゲットの名前や場所が変わることがある。IShellLink::Resolve
メソッドは最初にリンクに関連付けられたパスを取得する。オブジェクトがその場所にもう存在しないか名前が変更されている場合、Resolve
はそれを見つけようと試みる。成功し、次の条件が満たされている場合、リンクオブジェクトがロードされたファイルはリンクオブジェクトの新しい状態を反映するように更新される。
（以下省略）


%index
IShellLinkW_SetPath
シェルリンクオブジェクトのターゲットのパスとファイル名を設定する。(Unicode)
%group
COM misc / IShellLinkW
%prm
this, pszFile
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszFile : [wstr] 型: LPCTSTR 新しいパスを含むバッファのアドレス。
%inst
シェルリンクオブジェクトのターゲットのパスとファイル名を設定する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


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


%index
IWICBitmap_GetSize
IWICBitmap::GetSize (vtable slot 3)
%group
COM misc / IWICBitmap
%prm
this, puiWidth, puiHeight
this : [comobj] IWICBitmap インターフェースの COM オブジェクト変数
puiWidth : [int] 
puiHeight : [int] 
%inst


%index
IWICBitmap_GetPixelFormat
IWICBitmap::GetPixelFormat (vtable slot 4)
%group
COM misc / IWICBitmap
%prm
this, pPixelFormat
this : [comobj] IWICBitmap インターフェースの COM オブジェクト変数
pPixelFormat : [var] 
%inst


%index
IWICBitmap_GetResolution
IWICBitmap::GetResolution (vtable slot 5)
%group
COM misc / IWICBitmap
%prm
this, pDpiX, pDpiY
this : [comobj] IWICBitmap インターフェースの COM オブジェクト変数
pDpiX : [double] 
pDpiY : [double] 
%inst


%index
IWICBitmap_CopyPalette
IWICBitmap::CopyPalette (vtable slot 6)
%group
COM misc / IWICBitmap
%prm
this, pIPalette
this : [comobj] IWICBitmap インターフェースの COM オブジェクト変数
pIPalette : [comobj] 
%inst


%index
IWICBitmap_CopyPixels
IWICBitmap::CopyPixels (vtable slot 7)
%group
COM misc / IWICBitmap
%prm
this, prc, cbStride, cbBufferSize, pbBuffer
this : [comobj] IWICBitmap インターフェースの COM オブジェクト変数
prc : [var] 
cbStride : [int] 
cbBufferSize : [int] 
pbBuffer : [int] 
%inst


%index
IWICBitmap_Lock
Provides access to a rectangular area of the bitmap.
%group
COM misc / IWICBitmap
%prm
this, prcLock, flags, ppILock
this : [comobj] IWICBitmap インターフェースの COM オブジェクト変数
prcLock : [var] Type: const WICRect* The rectangle to be accessed.
flags : [int] Type: DWORD The access mode you wish to obtain for the lock. This is a bitwise combination of WICBitmapLockFlags for read, write, or read and write access.
ppILock : [comobj] Type: IWICBitmapLock** A pointer that receives the locked memory location.
%inst
Provides access to a rectangular area of the bitmap.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Locks are exclusive for writing but can be shared for reading. You
cannot call CopyPixels while the IWICBitmap is locked for writing.
Doing so will return an error, since locks are exclusive.


%index
IWICBitmap_SetPalette
Provides access for palette modifications.
%group
COM misc / IWICBitmap
%prm
this, pIPalette
this : [comobj] IWICBitmap インターフェースの COM オブジェクト変数
pIPalette : [comobj] Type: IWICPalette* The palette to use for conversion.
%inst
Provides access for palette modifications.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmap_SetResolution
Changes the physical resolution of the image.
%group
COM misc / IWICBitmap
%prm
this, dpiX, dpiY
this : [comobj] IWICBitmap インターフェースの COM オブジェクト変数
dpiX : [double] Type: double The horizontal resolution.
dpiY : [double] Type: double The vertical resolution.
%inst
Changes the physical resolution of the image.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This method has no effect on the actual pixels or samples stored in
the bitmap. Instead the interpretation of the sampling rate is
modified. This means that a 96 DPI image which is 96 pixels wide is
one inch. If the physical resolution is modified to 48 DPI, then the
bitmap is considered to be 2 inches wide but has the same number of
pixels. If the resolution is less than REAL_EPSILON
(1.192092896e-07F) the error code WINCODEC_ERR_INVALIDPARAMETER is
returned.


%index
IWICBitmapClipper_GetSize
IWICBitmapClipper::GetSize (vtable slot 3)
%group
COM misc / IWICBitmapClipper
%prm
this, puiWidth, puiHeight
this : [comobj] IWICBitmapClipper インターフェースの COM オブジェクト変数
puiWidth : [int] 
puiHeight : [int] 
%inst


%index
IWICBitmapClipper_GetPixelFormat
IWICBitmapClipper::GetPixelFormat (vtable slot 4)
%group
COM misc / IWICBitmapClipper
%prm
this, pPixelFormat
this : [comobj] IWICBitmapClipper インターフェースの COM オブジェクト変数
pPixelFormat : [var] 
%inst


%index
IWICBitmapClipper_GetResolution
IWICBitmapClipper::GetResolution (vtable slot 5)
%group
COM misc / IWICBitmapClipper
%prm
this, pDpiX, pDpiY
this : [comobj] IWICBitmapClipper インターフェースの COM オブジェクト変数
pDpiX : [double] 
pDpiY : [double] 
%inst


%index
IWICBitmapClipper_CopyPalette
IWICBitmapClipper::CopyPalette (vtable slot 6)
%group
COM misc / IWICBitmapClipper
%prm
this, pIPalette
this : [comobj] IWICBitmapClipper インターフェースの COM オブジェクト変数
pIPalette : [comobj] 
%inst


%index
IWICBitmapClipper_CopyPixels
IWICBitmapClipper::CopyPixels (vtable slot 7)
%group
COM misc / IWICBitmapClipper
%prm
this, prc, cbStride, cbBufferSize, pbBuffer
this : [comobj] IWICBitmapClipper インターフェースの COM オブジェクト変数
prc : [var] 
cbStride : [int] 
cbBufferSize : [int] 
pbBuffer : [int] 
%inst


%index
IWICBitmapClipper_Initialize
Initializes the bitmap clipper with the provided parameters.
%group
COM misc / IWICBitmapClipper
%prm
this, pISource, prc
this : [comobj] IWICBitmapClipper インターフェースの COM オブジェクト変数
pISource : [comobj] Type: IWICBitmapSource* he input bitmap source.
prc : [var] Type: const WICRect* The rectangle of the bitmap source to clip.
%inst
Initializes the bitmap clipper with the provided parameters.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapCodecInfo_GetComponentType
IWICBitmapCodecInfo::GetComponentType (vtable slot 3)
%group
COM misc / IWICBitmapCodecInfo
%prm
this, pType
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
pType : [var] 
%inst


%index
IWICBitmapCodecInfo_GetCLSID
IWICBitmapCodecInfo::GetCLSID (vtable slot 4)
%group
COM misc / IWICBitmapCodecInfo
%prm
this, pclsid
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
pclsid : [var] 
%inst


%index
IWICBitmapCodecInfo_GetSigningStatus
IWICBitmapCodecInfo::GetSigningStatus (vtable slot 5)
%group
COM misc / IWICBitmapCodecInfo
%prm
this, pStatus
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
pStatus : [int] 
%inst


%index
IWICBitmapCodecInfo_GetAuthor
IWICBitmapCodecInfo::GetAuthor (vtable slot 6)
%group
COM misc / IWICBitmapCodecInfo
%prm
this, cchAuthor, wzAuthor, pcchActual
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
cchAuthor : [int] 
wzAuthor : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapCodecInfo_GetVendorGUID
IWICBitmapCodecInfo::GetVendorGUID (vtable slot 7)
%group
COM misc / IWICBitmapCodecInfo
%prm
this, pguidVendor
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
pguidVendor : [var] 
%inst


%index
IWICBitmapCodecInfo_GetVersion
IWICBitmapCodecInfo::GetVersion (vtable slot 8)
%group
COM misc / IWICBitmapCodecInfo
%prm
this, cchVersion, wzVersion, pcchActual
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
cchVersion : [int] 
wzVersion : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapCodecInfo_GetSpecVersion
IWICBitmapCodecInfo::GetSpecVersion (vtable slot 9)
%group
COM misc / IWICBitmapCodecInfo
%prm
this, cchSpecVersion, wzSpecVersion, pcchActual
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
cchSpecVersion : [int] 
wzSpecVersion : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapCodecInfo_GetFriendlyName
IWICBitmapCodecInfo::GetFriendlyName (vtable slot 10)
%group
COM misc / IWICBitmapCodecInfo
%prm
this, cchFriendlyName, wzFriendlyName, pcchActual
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
cchFriendlyName : [int] 
wzFriendlyName : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapCodecInfo_GetContainerFormat
Retrieves the container GUID associated with the codec.
%group
COM misc / IWICBitmapCodecInfo
%prm
this, pguidContainerFormat
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
pguidContainerFormat : [var] Type: GUID* Receives the container GUID.
%inst
Retrieves the container GUID associated with the codec.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapCodecInfo_GetPixelFormats
Retrieves the pixel formats the codec supports.
%group
COM misc / IWICBitmapCodecInfo
%prm
this, cFormats, pguidPixelFormats, pcActual
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
cFormats : [int] Type: UINT The size of the pguidPixelFormats array. Use 0 on first call to determine the needed array size.
pguidPixelFormats : [var] Type: GUID* Receives the supported pixel formats. Use NULL on first call to determine needed array size.
pcActual : [int] Type: UINT* The array size needed to retrieve all supported pixel formats.
%inst
Retrieves the pixel formats the codec supports.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The usage pattern for this method is a two call process. The first
call retrieves the array size needed to retrieve all the supported
pixel formats by calling it with cFormats set to 0 and
pguidPixelFormats set to NULL. This call sets pcActual to the array
size needed. Once the needed array size is determined, a second
GetPixelFormats call with pguidPixelFormats set to an array of the
appropriate size will retrieve the pixel formats.


%index
IWICBitmapCodecInfo_GetColorManagementVersion
Retrieves the color management version number the codec supports.
%group
COM misc / IWICBitmapCodecInfo
%prm
this, cchColorManagementVersion, wzColorManagementVersion, pcchActual
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
cchColorManagementVersion : [int] Type: UINT The size of the version buffer. Use 0 on first call to determine needed buffer size.
wzColorManagementVersion : [wstr] Type: WCHAR* Receives the color management version number. Use NULL on first call to determine needed buffer size.
pcchActual : [int] Type: UINT* The actual buffer size needed to retrieve the full color management version number.
%inst
Retrieves the color management version number the codec supports.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The usage pattern for this method is a two call process. The first
call retrieves the buffer size needed to retrieve the full color
management version number by calling it with
cchColorManagementVersion set to 0 and wzColorManagementVersion set
to NULL. This call sets pcchActual to the buffer size needed. Once
the needed buffer size is determined, a second
GetColorManagementVersion call with cchColorManagementVersion set to
the buffer size and wzColorManagementVersion set to a buffer of the
appropriate size will retrieve the pixel formats.


%index
IWICBitmapCodecInfo_GetDeviceManufacturer
Retrieves the name of the device manufacture associated with the codec.
%group
COM misc / IWICBitmapCodecInfo
%prm
this, cchDeviceManufacturer, wzDeviceManufacturer, pcchActual
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
cchDeviceManufacturer : [int] Type: UINT The size of the device manufacture's name. Use 0 on first call to determine needed buffer size.
wzDeviceManufacturer : [wstr] Type: WCHAR* Receives the device manufacture's name. Use NULL on first call to determine needed buffer size.
pcchActual : [int] Type: UINT* The actual buffer size needed to retrieve the device manufacture's name.
%inst
Retrieves the name of the device manufacture associated with the
codec.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The usage pattern for this method is a two call process. The first
call retrieves the buffer size needed to retrieve the full color
management version number by calling it with cchDeviceManufacturer
set to 0 and wzDeviceManufacturer set to NULL. This call sets
pcchActual to the buffer size needed. Once the needed buffer size is
determined, a second GetDeviceManufacturer call with
cchDeviceManufacturer set to the buffer size and wzDeviceManufacturer
set to a buffer of the appropriate size will retrieve the pixel
formats.


%index
IWICBitmapCodecInfo_GetDeviceModels
Retrieves a comma delimited list of device models associated with the codec.
%group
COM misc / IWICBitmapCodecInfo
%prm
this, cchDeviceModels, wzDeviceModels, pcchActual
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
cchDeviceModels : [int] Type: UINT The size of the device models buffer. Use 0 on first call to determine needed buffer size.
wzDeviceModels : [wstr] Type: WCHAR* Receives a comma delimited list of device model names associated with the codec. Use NULL on first call to determine needed buffer size.
pcchActual : [int] Type: UINT* The actual buffer size needed to retrieve all of the device model names.
%inst
Retrieves a comma delimited list of device models associated with the
codec.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The usage pattern for this method is a two call process. The first
call retrieves the buffer size needed to retrieve the full color
management version number by calling it with cchDeviceModels set to 0
and wzDeviceModels set to NULL. This call sets pcchActual to the
buffer size needed. Once the needed buffer size is determined, a
second GetDeviceModels call with cchDeviceModels set to the buffer
size and wzDeviceModels set to a buffer of the appropriate size will
retrieve the pixel formats.


%index
IWICBitmapCodecInfo_GetMimeTypes
Retrieves a comma delimited sequence of mime types associated with the codec.
%group
COM misc / IWICBitmapCodecInfo
%prm
this, cchMimeTypes, wzMimeTypes, pcchActual
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
cchMimeTypes : [int] Type: UINT The size of the mime types buffer.  Use 0 on first call to determine needed buffer size.
wzMimeTypes : [wstr] Type: WCHAR* Receives the mime types associated with the codec. Use NULL on first call to determine needed buffer size.
pcchActual : [int] Type: UINT* The actual buffer size needed to retrieve all mime types associated with the codec.
%inst
Retrieves a comma delimited sequence of mime types associated with
the codec.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The usage pattern for this method is a two call process. The first
call retrieves the buffer size needed to retrieve the full color
management version number by calling it with cchMimeTypes set to 0
and wzMimeTypes set to NULL. This call sets pcchActual to the buffer
size needed. Once the needed buffer size is determined, a second
GetMimeTypes call with cchMimeTypes set to the buffer size and
wzMimeTypes set to a buffer of the appropriate size will retrieve the
pixel formats.


%index
IWICBitmapCodecInfo_GetFileExtensions
Retrieves a comma delimited list of the file name extensions associated with the codec.
%group
COM misc / IWICBitmapCodecInfo
%prm
this, cchFileExtensions, wzFileExtensions, pcchActual
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
cchFileExtensions : [int] Type: UINT The size of the file name extension buffer. Use 0 on first call to determine needed buffer size.
wzFileExtensions : [wstr] Type: WCHAR* Receives a comma delimited list  of file name extensions associated with the codec. Use NULL on first call to determine needed buffer size.
pcchActual : [int] Type: UINT* The actual buffer size needed to retrieve all file name extensions associated with the codec.
%inst
Retrieves a comma delimited list of the file name extensions
associated with the codec.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The default extension for an image encoder is the first item in the
list of returned extensions. The usage pattern for this method is a
two call process. The first call retrieves the buffer size needed to
retrieve the full color management version number by calling it with
cchFileExtensions set to 0 and wzFileExtensions set to NULL. This
call sets pcchActual to the buffer size needed. Once the needed
buffer size is determined, a second GetFileExtensions call with
cchFileExtensions set to the buffer size and wzFileExtensions set to
a buffer of the appropriate size will retrieve the pixel formats.


%index
IWICBitmapCodecInfo_DoesSupportAnimation
Retrieves a value indicating whether the codec supports animation.
%group
COM misc / IWICBitmapCodecInfo
%prm
this, pfSupportAnimation
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
pfSupportAnimation : [var] Type: BOOL* Receives TRUE if the codec supports images with timing information; otherwise, FALSE.
%inst
Retrieves a value indicating whether the codec supports animation.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapCodecInfo_DoesSupportChromakey
Retrieves a value indicating whether the codec supports chromakeys.
%group
COM misc / IWICBitmapCodecInfo
%prm
this, pfSupportChromakey
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
pfSupportChromakey : [var] Type: BOOL* Receives TRUE if the codec supports chromakeys; otherwise, FALSE.
%inst
Retrieves a value indicating whether the codec supports chromakeys.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapCodecInfo_DoesSupportLossless
Retrieves a value indicating whether the codec supports lossless formats.
%group
COM misc / IWICBitmapCodecInfo
%prm
this, pfSupportLossless
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
pfSupportLossless : [var] Type: BOOL* Receives TRUE if the codec supports lossless formats; otherwise, FALSE.
%inst
Retrieves a value indicating whether the codec supports lossless
formats.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapCodecInfo_DoesSupportMultiframe
Retrieves a value indicating whether the codec supports multi frame images.
%group
COM misc / IWICBitmapCodecInfo
%prm
this, pfSupportMultiframe
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
pfSupportMultiframe : [var] Type: BOOL* Receives TRUE if the codec supports multi frame images; otherwise, FALSE.
%inst
Retrieves a value indicating whether the codec supports multi frame
images.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapCodecInfo_MatchesMimeType
Retrieves a value indicating whether the given mime type matches the mime type of the codec.
%group
COM misc / IWICBitmapCodecInfo
%prm
this, wzMimeType, pfMatches
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
wzMimeType : [wstr] Type: LPCWSTR The mime type to compare.
pfMatches : [var] Type: BOOL* Receives TRUE if the mime types match; otherwise, FALSE.
%inst
Retrieves a value indicating whether the given mime type matches the
mime type of the codec.

[戻り値]
Type: HRESULT This method can return one of these values.
This doc was truncated.

[備考]
Note The Windows provided codecs do not implement this method and
return E_NOTIMPL.


%index
IWICBitmapDecoder_QueryCapability
Retrieves the capabilities of the decoder based on the specified stream.
%group
COM misc / IWICBitmapDecoder
%prm
this, pIStream, pdwCapability
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
pIStream : [comobj] Type: IStream* The stream to retrieve the decoder capabilities from.
pdwCapability : [int] Type: DWORD* The WICBitmapDecoderCapabilities of the decoder.
%inst
Retrieves the capabilities of the decoder based on the specified
stream.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Custom decoder implementations should save the current position of
the specified IStream, read whatever information is necessary in
order to determine which capabilities it can provide for the supplied
stream, and restore the stream position.


%index
IWICBitmapDecoder_Initialize
Initializes the decoder with the provided stream.
%group
COM misc / IWICBitmapDecoder
%prm
this, pIStream, cacheOptions
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
pIStream : [comobj] Type: IStream* The stream to use for initialization. The stream contains the encoded pixels which are decoded each time the CopyPixels method on the IWICBitmapFrameDecode interface (see GetFrame) is invoked.
cacheOptions : [int] Type: WICDecodeOptions The WICDecodeOptions to use for initialization.
%inst
Initializes the decoder with the provided stream.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapDecoder_GetContainerFormat
Retrieves the image's container format.
%group
COM misc / IWICBitmapDecoder
%prm
this, pguidContainerFormat
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
pguidContainerFormat : [var] Type: GUID* A pointer that receives the image's container format GUID.
%inst
Retrieves the image's container format.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapDecoder_GetDecoderInfo
Retrieves an IWICBitmapDecoderInfo for the image.
%group
COM misc / IWICBitmapDecoder
%prm
this, ppIDecoderInfo
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
ppIDecoderInfo : [comobj] Type: IWICBitmapDecoderInfo** A pointer that receives a pointer to an IWICBitmapDecoderInfo.
%inst
Retrieves an IWICBitmapDecoderInfo for the image.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapDecoder_CopyPalette
Copies the decoder's IWICPalette .
%group
COM misc / IWICBitmapDecoder
%prm
this, pIPalette
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
pIPalette : [comobj] Type: IWICPalette* AnIWICPalette to which the decoder's global palette is to be copied. Use CreatePalette to create the destination palette before calling CopyPalette.
%inst
Copies the decoder's IWICPalette .

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
CopyPalette returns a global palette (a palette that applies to all
the frames in the image) if there is one; otherwise, it returns
WINCODEC_ERR_PALETTEUNAVAILABLE. If an image doesn't have a global
palette, it may still have a frame-level palette, which can be
retrieved using IWICBitmapFrameDecode::CopyPalette.


%index
IWICBitmapDecoder_GetMetadataQueryReader
Retrieves the metadata query reader from the decoder.
%group
COM misc / IWICBitmapDecoder
%prm
this, ppIMetadataQueryReader
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
ppIMetadataQueryReader : [comobj] Type: IWICMetadataQueryReader** Receives a pointer to the decoder's IWICMetadataQueryReader.
%inst
Retrieves the metadata query reader from the decoder.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
If an image format does not support container-level metadata, this
will return WINCODEC_ERR_UNSUPPORTEDOPERATION. The only Windows
provided image format that supports container-level metadata is GIF.
Instead, use IWICBitmapFrameDecode::GetMetadataQueryReader.


%index
IWICBitmapDecoder_GetPreview
Retrieves a preview image, if supported.
%group
COM misc / IWICBitmapDecoder
%prm
this, ppIBitmapSource
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
ppIBitmapSource : [comobj] Type: IWICBitmapSource** Receives a pointer to the preview bitmap if supported.
%inst
Retrieves a preview image, if supported.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Not all formats support previews. Only the native Microsoft Windows
Digital Photo (WDP) codec support previews.


%index
IWICBitmapDecoder_GetColorContexts
Retrieves the IWICColorContext objects of the image.
%group
COM misc / IWICBitmapDecoder
%prm
this, cCount, ppIColorContexts, pcActualCount
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
cCount : [int] Type: UINT The number of color contexts to retrieve. This value must be the size of, or smaller than, the size available to ppIColorContexts.
ppIColorContexts : [comobj] Type: IWICColorContext** A pointer that receives a pointer to the IWICColorContext.
pcActualCount : [int] Type: UINT* A pointer that receives the number of color contexts contained in the image.
%inst
Retrieves the IWICColorContext objects of the image.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapDecoder_GetThumbnail
Retrieves a bitmap thumbnail of the image, if one exists
%group
COM misc / IWICBitmapDecoder
%prm
this, ppIThumbnail
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
ppIThumbnail : [comobj] Type: IWICBitmapSource** Receives a pointer to the IWICBitmapSource of the thumbnail.
%inst
Retrieves a bitmap thumbnail of the image, if one exists

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The returned thumbnail can be of any size, so the caller should scale
the thumbnail to the desired size. The only Windows provided image
formats that support thumbnails are JPEG, TIFF, and JPEG-XR. If the
thumbnail is not available, this will return
WINCODEC_ERR_CODECNOTHUMBNAIL.


%index
IWICBitmapDecoder_GetFrameCount
Retrieves the total number of frames in the image.
%group
COM misc / IWICBitmapDecoder
%prm
this, pCount
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
pCount : [int] Type: UINT* A pointer that receives the total number of frames in the image.
%inst
Retrieves the total number of frames in the image.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapDecoder_GetFrame
Retrieves the specified frame of the image.
%group
COM misc / IWICBitmapDecoder
%prm
this, index, ppIBitmapFrame
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
index : [int] Type: UINT The particular frame to retrieve.
ppIBitmapFrame : [comobj] Type: IWICBitmapFrameDecode** A pointer that receives a pointer to the IWICBitmapFrameDecode.
%inst
Retrieves the specified frame of the image.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapDecoderInfo_GetComponentType
IWICBitmapDecoderInfo::GetComponentType (vtable slot 3)
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, pType
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
pType : [var] 
%inst


%index
IWICBitmapDecoderInfo_GetCLSID
IWICBitmapDecoderInfo::GetCLSID (vtable slot 4)
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, pclsid
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
pclsid : [var] 
%inst


%index
IWICBitmapDecoderInfo_GetSigningStatus
IWICBitmapDecoderInfo::GetSigningStatus (vtable slot 5)
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, pStatus
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
pStatus : [int] 
%inst


%index
IWICBitmapDecoderInfo_GetAuthor
IWICBitmapDecoderInfo::GetAuthor (vtable slot 6)
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, cchAuthor, wzAuthor, pcchActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cchAuthor : [int] 
wzAuthor : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapDecoderInfo_GetVendorGUID
IWICBitmapDecoderInfo::GetVendorGUID (vtable slot 7)
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, pguidVendor
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
pguidVendor : [var] 
%inst


%index
IWICBitmapDecoderInfo_GetVersion
IWICBitmapDecoderInfo::GetVersion (vtable slot 8)
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, cchVersion, wzVersion, pcchActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cchVersion : [int] 
wzVersion : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapDecoderInfo_GetSpecVersion
IWICBitmapDecoderInfo::GetSpecVersion (vtable slot 9)
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, cchSpecVersion, wzSpecVersion, pcchActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cchSpecVersion : [int] 
wzSpecVersion : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapDecoderInfo_GetFriendlyName
IWICBitmapDecoderInfo::GetFriendlyName (vtable slot 10)
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, cchFriendlyName, wzFriendlyName, pcchActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cchFriendlyName : [int] 
wzFriendlyName : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapDecoderInfo_GetContainerFormat
IWICBitmapDecoderInfo::GetContainerFormat (vtable slot 11)
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, pguidContainerFormat
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
pguidContainerFormat : [var] 
%inst


%index
IWICBitmapDecoderInfo_GetPixelFormats
IWICBitmapDecoderInfo::GetPixelFormats (vtable slot 12)
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, cFormats, pguidPixelFormats, pcActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cFormats : [int] 
pguidPixelFormats : [var] 
pcActual : [int] 
%inst


%index
IWICBitmapDecoderInfo_GetColorManagementVersion
IWICBitmapDecoderInfo::GetColorManagementVersion (vtable slot 13)
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, cchColorManagementVersion, wzColorManagementVersion, pcchActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cchColorManagementVersion : [int] 
wzColorManagementVersion : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapDecoderInfo_GetDeviceManufacturer
IWICBitmapDecoderInfo::GetDeviceManufacturer (vtable slot 14)
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, cchDeviceManufacturer, wzDeviceManufacturer, pcchActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cchDeviceManufacturer : [int] 
wzDeviceManufacturer : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapDecoderInfo_GetDeviceModels
IWICBitmapDecoderInfo::GetDeviceModels (vtable slot 15)
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, cchDeviceModels, wzDeviceModels, pcchActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cchDeviceModels : [int] 
wzDeviceModels : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapDecoderInfo_GetMimeTypes
IWICBitmapDecoderInfo::GetMimeTypes (vtable slot 16)
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, cchMimeTypes, wzMimeTypes, pcchActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cchMimeTypes : [int] 
wzMimeTypes : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapDecoderInfo_GetFileExtensions
IWICBitmapDecoderInfo::GetFileExtensions (vtable slot 17)
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, cchFileExtensions, wzFileExtensions, pcchActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cchFileExtensions : [int] 
wzFileExtensions : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapDecoderInfo_DoesSupportAnimation
IWICBitmapDecoderInfo::DoesSupportAnimation (vtable slot 18)
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, pfSupportAnimation
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
pfSupportAnimation : [var] 
%inst


%index
IWICBitmapDecoderInfo_DoesSupportChromakey
IWICBitmapDecoderInfo::DoesSupportChromakey (vtable slot 19)
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, pfSupportChromakey
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
pfSupportChromakey : [var] 
%inst


%index
IWICBitmapDecoderInfo_DoesSupportLossless
IWICBitmapDecoderInfo::DoesSupportLossless (vtable slot 20)
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, pfSupportLossless
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
pfSupportLossless : [var] 
%inst


%index
IWICBitmapDecoderInfo_DoesSupportMultiframe
IWICBitmapDecoderInfo::DoesSupportMultiframe (vtable slot 21)
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, pfSupportMultiframe
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
pfSupportMultiframe : [var] 
%inst


%index
IWICBitmapDecoderInfo_MatchesMimeType
IWICBitmapDecoderInfo::MatchesMimeType (vtable slot 22)
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, wzMimeType, pfMatches
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
wzMimeType : [wstr] 
pfMatches : [var] 
%inst


%index
IWICBitmapDecoderInfo_GetPatterns
Retrieves the file pattern signatures supported by the decoder.
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, cbSizePatterns, pPatterns, pcPatterns, pcbPatternsActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cbSizePatterns : [int] Type: UINT The array size of the pPatterns array.
pPatterns : [var] Type: WICBitmapPattern* Receives a list of WICBitmapPattern objects supported by the decoder.
pcPatterns : [var] Type: UINT* Receives the number of patterns the decoder supports.
pcbPatternsActual : [int] Type: UINT* Receives the actual buffer size needed to retrieve all pattern signatures supported by the decoder.
%inst
Retrieves the file pattern signatures supported by the decoder.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
To retrieve all pattern signatures, this method should first be
called with pPatterns set to NULL to retrieve the actual buffer size
needed through pcbPatternsActual. Once the needed buffer size is
known, allocate a buffer of the needed size and call GetPatterns
again with the allocated buffer.


%index
IWICBitmapDecoderInfo_MatchesPattern
Retrieves a value that indicates whether the codec recognizes the pattern within a specified stream.
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, pIStream, pfMatches
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
pIStream : [comobj] Type: IStream* The stream to pattern match within.
pfMatches : [var] Type: BOOL* A pointer that receives TRUE if the patterns match; otherwise, FALSE.
%inst
Retrieves a value that indicates whether the codec recognizes the
pattern within a specified stream.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapDecoderInfo_CreateInstance
Creates a new IWICBitmapDecoder instance.
%group
COM misc / IWICBitmapDecoderInfo
%prm
this, ppIBitmapDecoder
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
ppIBitmapDecoder : [comobj] Type: IWICBitmapDecoder** A pointer that receives a pointer to a new instance of the IWICBitmapDecoder.
%inst
Creates a new IWICBitmapDecoder instance.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapEncoder_Initialize
Initializes the encoder with an IStream which tells the encoder where to encode the bits.
%group
COM misc / IWICBitmapEncoder
%prm
this, pIStream, cacheOption
this : [comobj] IWICBitmapEncoder インターフェースの COM オブジェクト変数
pIStream : [comobj] Type: IStream* The output stream.
cacheOption : [int] Type: WICBitmapEncoderCacheOption The WICBitmapEncoderCacheOption used on initialization.
%inst
Initializes the encoder with an IStream which tells the encoder where
to encode the bits.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapEncoder_GetContainerFormat
Retrieves the encoder's container format.
%group
COM misc / IWICBitmapEncoder
%prm
this, pguidContainerFormat
this : [comobj] IWICBitmapEncoder インターフェースの COM オブジェクト変数
pguidContainerFormat : [var] Type: GUID* A pointer that receives the encoder's container format GUID.
%inst
Retrieves the encoder's container format.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapEncoder_GetEncoderInfo
Retrieves an IWICBitmapEncoderInfo for the encoder.
%group
COM misc / IWICBitmapEncoder
%prm
this, ppIEncoderInfo
this : [comobj] IWICBitmapEncoder インターフェースの COM オブジェクト変数
ppIEncoderInfo : [comobj] Type: IWICBitmapEncoderInfo** A pointer that receives a pointer to an IWICBitmapEncoderInfo.
%inst
Retrieves an IWICBitmapEncoderInfo for the encoder.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapEncoder_SetColorContexts
Sets the IWICColorContext objects for the encoder.
%group
COM misc / IWICBitmapEncoder
%prm
this, cCount, ppIColorContext
this : [comobj] IWICBitmapEncoder インターフェースの COM オブジェクト変数
cCount : [int] Type: UINT The number of IWICColorContext to set.
ppIColorContext : [comobj] Type: IWICColorContext** A pointer an IWICColorContext pointer containing the color contexts to set for the encoder.
%inst
Sets the IWICColorContext objects for the encoder.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapEncoder_SetPalette
Sets the global palette for the image.
%group
COM misc / IWICBitmapEncoder
%prm
this, pIPalette
this : [comobj] IWICBitmapEncoder インターフェースの COM オブジェクト変数
pIPalette : [comobj] Type: IWICPalette* The IWICPalette to use as the global palette.
%inst
Sets the global palette for the image.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise.
Returns WINCODEC_ERR_UNSUPPORTEDOPERATION if the feature is not
supported by the encoder.

[備考]
Only GIF images support an optional global palette, and you must set
the global palette before adding any frames to the image. You only
need to set the palette for indexed pixel formats.


%index
IWICBitmapEncoder_SetThumbnail
Sets the global thumbnail for the image.
%group
COM misc / IWICBitmapEncoder
%prm
this, pIThumbnail
this : [comobj] IWICBitmapEncoder インターフェースの COM オブジェクト変数
pIThumbnail : [comobj] Type: IWICBitmapSource* The IWICBitmapSource to set as the global thumbnail.
%inst
Sets the global thumbnail for the image.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise.
Returns WINCODEC_ERR_UNSUPPORTEDOPERATION if the feature is not
supported by the encoder.


%index
IWICBitmapEncoder_SetPreview
Sets the global preview for the image.
%group
COM misc / IWICBitmapEncoder
%prm
this, pIPreview
this : [comobj] IWICBitmapEncoder インターフェースの COM オブジェクト変数
pIPreview : [comobj] Type: IWICBitmapSource* The IWICBitmapSource to use as the global preview.
%inst
Sets the global preview for the image.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise.
Returns WINCODEC_ERR_UNSUPPORTEDOPERATION if the feature is not
supported by the encoder.


%index
IWICBitmapEncoder_CreateNewFrame
Creates a new IWICBitmapFrameEncode instance.
%group
COM misc / IWICBitmapEncoder
%prm
this, ppIFrameEncode, ppIEncoderOptions
this : [comobj] IWICBitmapEncoder インターフェースの COM オブジェクト変数
ppIFrameEncode : [comobj] Type: IWICBitmapFrameEncode** A pointer that receives a pointer to the new instance of an IWICBitmapFrameEncode.
ppIEncoderOptions : [comobj] Type: IPropertyBag2** Optional. Receives the named properties to use for subsequent frame initialization. See Remarks.
%inst
Creates a new IWICBitmapFrameEncode instance.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The parameter ppIEncoderOptions can be used to receive an
IPropertyBag2 that can then be used to specify encoder options. This
is done by passing a pointer to a NULL IPropertyBag2 pointer in
ppIEncoderOptions. The returned IPropertyBag2 is initialized with all
encoder options that are available for the given format, at their
default values. To specify non-default encoding behavior, set the
needed encoder options on the IPropertyBag2 and pass it to
IWICBitmapFrameEncode::Initialize. Note Do not pass in a pointer to
an initialized IPropertyBag2. The pointer will be overwritten, and
the original IPropertyBag2 will not be freed. Otherwise, you can pass
NULL in ppIEncoderOptions if you do not intend to specify encoder
options. See Encoding Overview for an example of how to set encoder
options. For formats that support encoding multiple frames (for
example, TIFF, JPEG-XR), you can work on only one frame at a time.
This means that you must call IWICBitmapFrameEncode::Commit before
you call CreateNewFrame again.


%index
IWICBitmapEncoder_Commit
Commits all changes for the image and closes the stream.
%group
COM misc / IWICBitmapEncoder
%prm
this
this : [comobj] IWICBitmapEncoder インターフェースの COM オブジェクト変数
%inst
Commits all changes for the image and closes the stream.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
To finalize an image, both the frame Commit and the encoder Commit
must be called. However, only call the encoder Commit method after
all frames have been committed. After the encoder has been committed,
it can't be re-initialized or reused with another stream. A new
encoder interface must be created, for example, with
IWICImagingFactory::CreateEncoder.
For the encoder Commit to succeed, you must at a minimum call
IWICBitmapEncoder::Initialize and either
IWICBitmapFrameEncode::WriteSource or
IWICBitmapFrameEncode::WritePixels.
IWICBitmapFrameEncode::WriteSource specifies all parameters needed to
encode the image data. IWICBitmapFrameEncode::WritePixels requires
that you also call IWICBitmapFrameEncode::SetSize,
IWICBitmapFrameEncode::SetPixelFormat, and
IWICBitmapFrameEncode::SetPalette (if the pixel format is indexed).


%index
IWICBitmapEncoder_GetMetadataQueryWriter
Retrieves a metadata query writer for the encoder.
%group
COM misc / IWICBitmapEncoder
%prm
this, ppIMetadataQueryWriter
this : [comobj] IWICBitmapEncoder インターフェースの COM オブジェクト変数
ppIMetadataQueryWriter : [comobj] Type: IWICMetadataQueryWriter** When this method returns, contains a pointer to the encoder's metadata query writer.
%inst
Retrieves a metadata query writer for the encoder.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapEncoderInfo_GetComponentType
IWICBitmapEncoderInfo::GetComponentType (vtable slot 3)
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, pType
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
pType : [var] 
%inst


%index
IWICBitmapEncoderInfo_GetCLSID
IWICBitmapEncoderInfo::GetCLSID (vtable slot 4)
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, pclsid
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
pclsid : [var] 
%inst


%index
IWICBitmapEncoderInfo_GetSigningStatus
IWICBitmapEncoderInfo::GetSigningStatus (vtable slot 5)
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, pStatus
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
pStatus : [int] 
%inst


%index
IWICBitmapEncoderInfo_GetAuthor
IWICBitmapEncoderInfo::GetAuthor (vtable slot 6)
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, cchAuthor, wzAuthor, pcchActual
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
cchAuthor : [int] 
wzAuthor : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapEncoderInfo_GetVendorGUID
IWICBitmapEncoderInfo::GetVendorGUID (vtable slot 7)
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, pguidVendor
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
pguidVendor : [var] 
%inst


%index
IWICBitmapEncoderInfo_GetVersion
IWICBitmapEncoderInfo::GetVersion (vtable slot 8)
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, cchVersion, wzVersion, pcchActual
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
cchVersion : [int] 
wzVersion : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapEncoderInfo_GetSpecVersion
IWICBitmapEncoderInfo::GetSpecVersion (vtable slot 9)
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, cchSpecVersion, wzSpecVersion, pcchActual
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
cchSpecVersion : [int] 
wzSpecVersion : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapEncoderInfo_GetFriendlyName
IWICBitmapEncoderInfo::GetFriendlyName (vtable slot 10)
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, cchFriendlyName, wzFriendlyName, pcchActual
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
cchFriendlyName : [int] 
wzFriendlyName : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapEncoderInfo_GetContainerFormat
IWICBitmapEncoderInfo::GetContainerFormat (vtable slot 11)
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, pguidContainerFormat
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
pguidContainerFormat : [var] 
%inst


%index
IWICBitmapEncoderInfo_GetPixelFormats
IWICBitmapEncoderInfo::GetPixelFormats (vtable slot 12)
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, cFormats, pguidPixelFormats, pcActual
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
cFormats : [int] 
pguidPixelFormats : [var] 
pcActual : [int] 
%inst


%index
IWICBitmapEncoderInfo_GetColorManagementVersion
IWICBitmapEncoderInfo::GetColorManagementVersion (vtable slot 13)
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, cchColorManagementVersion, wzColorManagementVersion, pcchActual
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
cchColorManagementVersion : [int] 
wzColorManagementVersion : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapEncoderInfo_GetDeviceManufacturer
IWICBitmapEncoderInfo::GetDeviceManufacturer (vtable slot 14)
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, cchDeviceManufacturer, wzDeviceManufacturer, pcchActual
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
cchDeviceManufacturer : [int] 
wzDeviceManufacturer : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapEncoderInfo_GetDeviceModels
IWICBitmapEncoderInfo::GetDeviceModels (vtable slot 15)
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, cchDeviceModels, wzDeviceModels, pcchActual
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
cchDeviceModels : [int] 
wzDeviceModels : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapEncoderInfo_GetMimeTypes
IWICBitmapEncoderInfo::GetMimeTypes (vtable slot 16)
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, cchMimeTypes, wzMimeTypes, pcchActual
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
cchMimeTypes : [int] 
wzMimeTypes : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapEncoderInfo_GetFileExtensions
IWICBitmapEncoderInfo::GetFileExtensions (vtable slot 17)
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, cchFileExtensions, wzFileExtensions, pcchActual
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
cchFileExtensions : [int] 
wzFileExtensions : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapEncoderInfo_DoesSupportAnimation
IWICBitmapEncoderInfo::DoesSupportAnimation (vtable slot 18)
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, pfSupportAnimation
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
pfSupportAnimation : [var] 
%inst


%index
IWICBitmapEncoderInfo_DoesSupportChromakey
IWICBitmapEncoderInfo::DoesSupportChromakey (vtable slot 19)
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, pfSupportChromakey
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
pfSupportChromakey : [var] 
%inst


%index
IWICBitmapEncoderInfo_DoesSupportLossless
IWICBitmapEncoderInfo::DoesSupportLossless (vtable slot 20)
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, pfSupportLossless
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
pfSupportLossless : [var] 
%inst


%index
IWICBitmapEncoderInfo_DoesSupportMultiframe
IWICBitmapEncoderInfo::DoesSupportMultiframe (vtable slot 21)
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, pfSupportMultiframe
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
pfSupportMultiframe : [var] 
%inst


%index
IWICBitmapEncoderInfo_MatchesMimeType
IWICBitmapEncoderInfo::MatchesMimeType (vtable slot 22)
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, wzMimeType, pfMatches
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
wzMimeType : [wstr] 
pfMatches : [var] 
%inst


%index
IWICBitmapEncoderInfo_CreateInstance
Creates a new IWICBitmapEncoder instance.
%group
COM misc / IWICBitmapEncoderInfo
%prm
this, ppIBitmapEncoder
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
ppIBitmapEncoder : [comobj] Type: IWICBitmapEncoder** A pointer that receives a pointer to a new IWICBitmapEncoder instance.
%inst
Creates a new IWICBitmapEncoder instance.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapFlipRotator_GetSize
IWICBitmapFlipRotator::GetSize (vtable slot 3)
%group
COM misc / IWICBitmapFlipRotator
%prm
this, puiWidth, puiHeight
this : [comobj] IWICBitmapFlipRotator インターフェースの COM オブジェクト変数
puiWidth : [int] 
puiHeight : [int] 
%inst


%index
IWICBitmapFlipRotator_GetPixelFormat
IWICBitmapFlipRotator::GetPixelFormat (vtable slot 4)
%group
COM misc / IWICBitmapFlipRotator
%prm
this, pPixelFormat
this : [comobj] IWICBitmapFlipRotator インターフェースの COM オブジェクト変数
pPixelFormat : [var] 
%inst


%index
IWICBitmapFlipRotator_GetResolution
IWICBitmapFlipRotator::GetResolution (vtable slot 5)
%group
COM misc / IWICBitmapFlipRotator
%prm
this, pDpiX, pDpiY
this : [comobj] IWICBitmapFlipRotator インターフェースの COM オブジェクト変数
pDpiX : [double] 
pDpiY : [double] 
%inst


%index
IWICBitmapFlipRotator_CopyPalette
IWICBitmapFlipRotator::CopyPalette (vtable slot 6)
%group
COM misc / IWICBitmapFlipRotator
%prm
this, pIPalette
this : [comobj] IWICBitmapFlipRotator インターフェースの COM オブジェクト変数
pIPalette : [comobj] 
%inst


%index
IWICBitmapFlipRotator_CopyPixels
IWICBitmapFlipRotator::CopyPixels (vtable slot 7)
%group
COM misc / IWICBitmapFlipRotator
%prm
this, prc, cbStride, cbBufferSize, pbBuffer
this : [comobj] IWICBitmapFlipRotator インターフェースの COM オブジェクト変数
prc : [var] 
cbStride : [int] 
cbBufferSize : [int] 
pbBuffer : [int] 
%inst


%index
IWICBitmapFlipRotator_Initialize
Initializes the bitmap flip rotator with the provided parameters.
%group
COM misc / IWICBitmapFlipRotator
%prm
this, pISource, options
this : [comobj] IWICBitmapFlipRotator インターフェースの COM オブジェクト変数
pISource : [comobj] Type: IWICBitmapSource* The input bitmap source.
options : [int] Type: WICBitmapTransformOptions The WICBitmapTransformOptions to flip or rotate the image.
%inst
Initializes the bitmap flip rotator with the provided parameters.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapFrameDecode_GetSize
IWICBitmapFrameDecode::GetSize (vtable slot 3)
%group
COM misc / IWICBitmapFrameDecode
%prm
this, puiWidth, puiHeight
this : [comobj] IWICBitmapFrameDecode インターフェースの COM オブジェクト変数
puiWidth : [int] 
puiHeight : [int] 
%inst


%index
IWICBitmapFrameDecode_GetPixelFormat
IWICBitmapFrameDecode::GetPixelFormat (vtable slot 4)
%group
COM misc / IWICBitmapFrameDecode
%prm
this, pPixelFormat
this : [comobj] IWICBitmapFrameDecode インターフェースの COM オブジェクト変数
pPixelFormat : [var] 
%inst


%index
IWICBitmapFrameDecode_GetResolution
IWICBitmapFrameDecode::GetResolution (vtable slot 5)
%group
COM misc / IWICBitmapFrameDecode
%prm
this, pDpiX, pDpiY
this : [comobj] IWICBitmapFrameDecode インターフェースの COM オブジェクト変数
pDpiX : [double] 
pDpiY : [double] 
%inst


%index
IWICBitmapFrameDecode_CopyPalette
IWICBitmapFrameDecode::CopyPalette (vtable slot 6)
%group
COM misc / IWICBitmapFrameDecode
%prm
this, pIPalette
this : [comobj] IWICBitmapFrameDecode インターフェースの COM オブジェクト変数
pIPalette : [comobj] 
%inst


%index
IWICBitmapFrameDecode_CopyPixels
IWICBitmapFrameDecode::CopyPixels (vtable slot 7)
%group
COM misc / IWICBitmapFrameDecode
%prm
this, prc, cbStride, cbBufferSize, pbBuffer
this : [comobj] IWICBitmapFrameDecode インターフェースの COM オブジェクト変数
prc : [var] 
cbStride : [int] 
cbBufferSize : [int] 
pbBuffer : [int] 
%inst


%index
IWICBitmapFrameDecode_GetMetadataQueryReader
Retrieves a metadata query reader for the frame.
%group
COM misc / IWICBitmapFrameDecode
%prm
this, ppIMetadataQueryReader
this : [comobj] IWICBitmapFrameDecode インターフェースの COM オブジェクト変数
ppIMetadataQueryReader : [comobj] Type: IWICMetadataQueryReader** When this method returns, contains a pointer to the frame's metadata query reader.
%inst
Retrieves a metadata query reader for the frame.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
For image formats with one frame (JPG, PNG, JPEG-XR), the frame-level
query reader of the first frame is used to access all image metadata,
and the decoder-level query reader isn’t used. For formats with more
than one frame (GIF, TIFF), the frame-level query reader for a given
frame is used to access metadata specific to that frame, and in the
case of GIF a decoder-level metadata reader will be present. If the
decoder doesn’t support metadata (BMP, ICO), this will return
WINCODEC_ERR_UNSUPPORTEDOPERATION.


%index
IWICBitmapFrameDecode_GetColorContexts
Retrieves the IWICColorContext associated with the image frame.
%group
COM misc / IWICBitmapFrameDecode
%prm
this, cCount, ppIColorContexts, pcActualCount
this : [comobj] IWICBitmapFrameDecode インターフェースの COM オブジェクト変数
cCount : [int] Type: UINT The number of color contexts to retrieve. This value must be the size of, or smaller than, the size available to ppIColorContexts.
ppIColorContexts : [comobj] Type: IWICColorContext** A pointer that receives a pointer to the IWICColorContext objects.
pcActualCount : [int] Type: UINT* A pointer that receives the number of color contexts contained in the image frame.
%inst
Retrieves the IWICColorContext associated with the image frame.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
If NULL is passed for ppIColorContexts, and 0 is passed for cCount,
this method will return the total number of color contexts in the
image in pcActualCount.
The ppIColorContexts array must be filled with valid data: each
IWICColorContext* in the array must have been created using
IWICImagingFactory::CreateColorContext.


%index
IWICBitmapFrameDecode_GetThumbnail
Retrieves a small preview of the frame, if supported by the codec.
%group
COM misc / IWICBitmapFrameDecode
%prm
this, ppIThumbnail
this : [comobj] IWICBitmapFrameDecode インターフェースの COM オブジェクト変数
ppIThumbnail : [comobj] Type: IWICBitmapSource** A pointer that receives a pointer to the IWICBitmapSource of the thumbnail.
%inst
Retrieves a small preview of the frame, if supported by the codec.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Not all formats support thumbnails. Joint Photographic Experts Group
(JPEG), Tagged Image File Format (TIFF), and Microsoft Windows
Digital Photo (WDP) support thumbnails. Note to Implementers If the
codec does not support thumbnails, return
WINCODEC_ERROR_CODECNOTHUMBNAIL rather than E_NOTIMPL.


%index
IWICBitmapFrameEncode_Initialize
Initializes the frame encoder using the given properties.
%group
COM misc / IWICBitmapFrameEncode
%prm
this, pIEncoderOptions
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
pIEncoderOptions : [comobj] Type: IPropertyBag2* The set of properties to use for IWICBitmapFrameEncode initialization.
%inst
Initializes the frame encoder using the given properties.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
If you don't want any encoding options, pass NULL for
pIEncoderOptions. Otherwise, pass the IPropertyBag2 that was provided
by IWICBitmapEncoder::CreateNewFrame with updated values.
For a complete list of encoding options supported by the
Windows-provided codecs, see Native WIC Codecs.


%index
IWICBitmapFrameEncode_SetSize
Sets the output image dimensions for the frame.
%group
COM misc / IWICBitmapFrameEncode
%prm
this, uiWidth, uiHeight
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
uiWidth : [int] Type: UINT The width of the output image.
uiHeight : [int] Type: UINT The height of the output image.
%inst
Sets the output image dimensions for the frame.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapFrameEncode_SetResolution
Sets the physical resolution of the output image.
%group
COM misc / IWICBitmapFrameEncode
%prm
this, dpiX, dpiY
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
dpiX : [double] Type: double The horizontal resolution value.
dpiY : [double] Type: double The vertical resolution value.
%inst
Sets the physical resolution of the output image.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Windows Imaging Component (WIC) doesn't perform any special
processing as a result of DPI resolution values. For example, data
returned from IWICBitmapSource::CopyPixels isn't scaled by the DPI.
The app must handle DPI resolution.


%index
IWICBitmapFrameEncode_SetPixelFormat
Requests that the encoder use the specified pixel format.
%group
COM misc / IWICBitmapFrameEncode
%prm
this, pPixelFormat
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
pPixelFormat : [var] Type: WICPixelFormatGUID* On input, the requested pixel format GUID. On output, the closest pixel format GUID supported by the encoder; this may be different than the requested format. For a list of pixel format GUIDs, see Native Pixel Formats.
%inst
Requests that the encoder use the specified pixel format.

[戻り値]
Type: HRESULT Possible return values include the following.
This doc was truncated.

[備考]
The encoder might not support the requested pixel format. If not,
SetPixelFormat returns the closest match in the memory block that
pPixelFormat points to. If the returned pixel format doesn't match
the requested format, you must use an IWICFormatConverter object to
convert the pixel data.


%index
IWICBitmapFrameEncode_SetColorContexts
Sets a given number IWICColorContext profiles to the frame.
%group
COM misc / IWICBitmapFrameEncode
%prm
this, cCount, ppIColorContext
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
cCount : [int] Type: UINT The number of IWICColorContext profiles to set.
ppIColorContext : [comobj] Type: IWICColorContext** A pointer to an IWICColorContext pointer containing the color contexts profiles to set to the frame.
%inst
Sets a given number IWICColorContext profiles to the frame.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This doc was truncated.


%index
IWICBitmapFrameEncode_SetPalette
Sets the IWICPalette for indexed pixel formats.
%group
COM misc / IWICBitmapFrameEncode
%prm
this, pIPalette
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
pIPalette : [comobj] Type: IWICPalette* The IWICPalette to use for indexed pixel formats. The encoder may change the palette to reflect the pixel formats the encoder supports.
%inst
Sets the IWICPalette for indexed pixel formats.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This method doesn't fail if called on a frame whose pixel format is
set to a non-indexed pixel format. If the target pixel format is a
non-indexed format, the palette will be ignored. If you already
called IWICBitmapEncoder::SetPalette to set a global palette, this
method overrides that palette for the current frame. The palette must
be specified before your first call to WritePixels/WriteSource. Doing
so will cause WriteSource to use the specified palette when
converting the source image to the encoder pixel format. If no
palette is specified, a palette will be generated on the first call
to WriteSource.


%index
IWICBitmapFrameEncode_SetThumbnail
Sets the frame thumbnail if supported by the codec.
%group
COM misc / IWICBitmapFrameEncode
%prm
this, pIThumbnail
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
pIThumbnail : [comobj] Type: IWICBitmapSource* The bitmap source to use as the thumbnail.
%inst
Sets the frame thumbnail if supported by the codec.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise.
Returns WINCODEC_ERR_UNSUPPORTEDOPERATION if the feature is not
supported by the encoder.

[備考]
We recommend that you call SetThumbnail before calling WritePixels or
WriteSource. The thumbnail won't be added to the encoded file if
SetThumbnail is called after a call to WritePixels or WriteSource.
This doc was truncated.


%index
IWICBitmapFrameEncode_WritePixels
Copies scan-line data from a caller-supplied buffer to the IWICBitmapFrameEncode object.
%group
COM misc / IWICBitmapFrameEncode
%prm
this, lineCount, cbStride, cbBufferSize, pbPixels
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
lineCount : [int] Type: UINT The number of lines to encode.
cbStride : [int] Type: UINT The stride of the image pixels.
cbBufferSize : [int] Type: UINT The size of the pixel buffer.
pbPixels : [int] Type: BYTE* A pointer to the pixel buffer.
%inst
Copies scan-line data from a caller-supplied buffer to the
IWICBitmapFrameEncode object.

[戻り値]
Type: HRESULT Possible return values include the following.
This doc was truncated.

[備考]
Successive WritePixels calls are assumed to be sequential scan-line
access in the output image.


%index
IWICBitmapFrameEncode_WriteSource
Encodes a bitmap source.
%group
COM misc / IWICBitmapFrameEncode
%prm
this, pIBitmapSource, prc
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
pIBitmapSource : [comobj] Type: IWICBitmapSource* The bitmap source to encode.
prc : [var] Type: WICRect* The size rectangle of the bitmap source.
%inst
Encodes a bitmap source.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
If SetSize is not called prior to calling WriteSource, the size given
in prc is used if not NULL. Otherwise, the size of the
IWICBitmapSource given in pIBitmapSource is used. If SetPixelFormat
is not called prior to calling WriteSource, the pixel format of the
IWICBitmapSource given in pIBitmapSource is used. If SetResolution is
not called prior to calling WriteSource, the pixel format of
pIBitmapSource is used. If SetPalette is not called prior to calling
WriteSource, the target pixel format is indexed, and the pixel format
of pIBitmapSource matches the encoder frame's pixel format, then the
pIBitmapSource pixel format is used. When encoding a GIF image, if
the global palette is set and the frame level palette is not set
directly by the user or by a custom independent software vendor (ISV)
GIF codec, WriteSource will use the global palette to encode the
frame even when pIBitmapSource has a frame level palette. Starting
with Windows Vista, repeated WriteSource calls can be made as long as
the total accumulated source rect height is the same as set through
SetSize. Starting with Windows 8.1, the source rect must be at least
the dimensions set through SetSize. If the source rect width exceeds
the SetSize width, extra pixels on the right side are ignored. If the
source rect height exceeds the remaining unfilled height, extra scan
lines on the bottom are ignored.


%index
IWICBitmapFrameEncode_Commit
Commits the frame to the image.
%group
COM misc / IWICBitmapFrameEncode
%prm
this
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
%inst
Commits the frame to the image.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
After the frame Commit has been called, you can't use or reinitialize
the IWICBitmapFrameEncode object and any objects created from it.
To finalize the image, both the frame Commit and the encoder Commit
must be called. However, only call the encoder Commit method after
all frames have been committed.


%index
IWICBitmapFrameEncode_GetMetadataQueryWriter
Gets the metadata query writer for the encoder frame.
%group
COM misc / IWICBitmapFrameEncode
%prm
this, ppIMetadataQueryWriter
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
ppIMetadataQueryWriter : [comobj] Type: IWICMetadataQueryWriter** When this method returns, contains a pointer to metadata query writer for the encoder frame.
%inst
Gets the metadata query writer for the encoder frame.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
If you are setting metadata on the frame, you must do this before you
use IWICBitmapFrameEncode::WritePixels or
IWICBitmapFrameEncode::WriteSource to write any image pixels to the
frame


%index
IWICBitmapLock_GetSize
Retrieves the width and height, in pixels, of the locked rectangle.
%group
COM misc / IWICBitmapLock
%prm
this, puiWidth, puiHeight
this : [comobj] IWICBitmapLock インターフェースの COM オブジェクト変数
puiWidth : [int] Type: UINT* A pointer that receives the width of the locked rectangle.
puiHeight : [int] Type: UINT* A pointer that receives the height of the locked rectangle.
%inst
Retrieves the width and height, in pixels, of the locked rectangle.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapLock_GetStride
Provides access to the stride value for the memory.
%group
COM misc / IWICBitmapLock
%prm
this, pcbStride
this : [comobj] IWICBitmapLock インターフェースの COM オブジェクト変数
pcbStride : [int] Type: UINT*
%inst
Provides access to the stride value for the memory.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Note the stride value is specific to the IWICBitmapLock, not the
bitmap. For example, two consecutive locks on the same rectangle of a
bitmap may return different pointers and stride values, depending on
internal implementation.


%index
IWICBitmapLock_GetDataPointer
Gets the pointer to the top left pixel in the locked rectangle.
%group
COM misc / IWICBitmapLock
%prm
this, pcbBufferSize, ppbData
this : [comobj] IWICBitmapLock インターフェースの COM オブジェクト変数
pcbBufferSize : [int] Type: UINT* A pointer that receives the size of the buffer.
ppbData : [var] Type: BYTE** A pointer that receives a pointer to the top left pixel in the locked rectangle.
%inst
Gets the pointer to the top left pixel in the locked rectangle.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The pointer provided by this method should not be used outside of the
lifetime of the lock itself. GetDataPointer is not available in
multi-threaded apartment applications.


%index
IWICBitmapLock_GetPixelFormat
Gets the pixel format of for the locked area of pixels. This can be used to compute the number of bytes-per-pixel in the locked area.
%group
COM misc / IWICBitmapLock
%prm
this, pPixelFormat
this : [comobj] IWICBitmapLock インターフェースの COM オブジェクト変数
pPixelFormat : [var] Type: WICPixelFormatGUID* A pointer that receives the pixel format GUID of the locked area.
%inst
Gets the pixel format of for the locked area of pixels. This can be
used to compute the number of bytes-per-pixel in the locked area.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapScaler_GetSize
IWICBitmapScaler::GetSize (vtable slot 3)
%group
COM misc / IWICBitmapScaler
%prm
this, puiWidth, puiHeight
this : [comobj] IWICBitmapScaler インターフェースの COM オブジェクト変数
puiWidth : [int] 
puiHeight : [int] 
%inst


%index
IWICBitmapScaler_GetPixelFormat
IWICBitmapScaler::GetPixelFormat (vtable slot 4)
%group
COM misc / IWICBitmapScaler
%prm
this, pPixelFormat
this : [comobj] IWICBitmapScaler インターフェースの COM オブジェクト変数
pPixelFormat : [var] 
%inst


%index
IWICBitmapScaler_GetResolution
IWICBitmapScaler::GetResolution (vtable slot 5)
%group
COM misc / IWICBitmapScaler
%prm
this, pDpiX, pDpiY
this : [comobj] IWICBitmapScaler インターフェースの COM オブジェクト変数
pDpiX : [double] 
pDpiY : [double] 
%inst


%index
IWICBitmapScaler_CopyPalette
IWICBitmapScaler::CopyPalette (vtable slot 6)
%group
COM misc / IWICBitmapScaler
%prm
this, pIPalette
this : [comobj] IWICBitmapScaler インターフェースの COM オブジェクト変数
pIPalette : [comobj] 
%inst


%index
IWICBitmapScaler_CopyPixels
IWICBitmapScaler::CopyPixels (vtable slot 7)
%group
COM misc / IWICBitmapScaler
%prm
this, prc, cbStride, cbBufferSize, pbBuffer
this : [comobj] IWICBitmapScaler インターフェースの COM オブジェクト変数
prc : [var] 
cbStride : [int] 
cbBufferSize : [int] 
pbBuffer : [int] 
%inst


%index
IWICBitmapScaler_Initialize
Initializes the bitmap scaler with the provided parameters.
%group
COM misc / IWICBitmapScaler
%prm
this, pISource, uiWidth, uiHeight, mode
this : [comobj] IWICBitmapScaler インターフェースの COM オブジェクト変数
pISource : [comobj] Type: IWICBitmapSource* The input bitmap source.
uiWidth : [int] Type: UINT The destination width.
uiHeight : [int] Type: UINT The destination height.
mode : [int] Type: WICBitmapInterpolationMode The WICBitmapInterpolationMode to use when scaling.
%inst
Initializes the bitmap scaler with the provided parameters.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
IWICBitmapScaler can't be initialized multiple times. For example,
when scaling every frame in a multi-frame image, a new
IWICBitmapScaler must be created and initialized for each frame.


%index
IWICBitmapSource_GetSize
Retrieves the pixel width and height of the bitmap.
%group
COM misc / IWICBitmapSource
%prm
this, puiWidth, puiHeight
this : [comobj] IWICBitmapSource インターフェースの COM オブジェクト変数
puiWidth : [int] Type: UINT* A pointer that receives the pixel width of the bitmap.
puiHeight : [int] Type: UINT* A pointer that receives the pixel height of the bitmap
%inst
Retrieves the pixel width and height of the bitmap.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICBitmapSource_GetPixelFormat
Retrieves the pixel format of the bitmap source..
%group
COM misc / IWICBitmapSource
%prm
this, pPixelFormat
this : [comobj] IWICBitmapSource インターフェースの COM オブジェクト変数
pPixelFormat : [var] Type: WICPixelFormatGUID* Receives the pixel format GUID the bitmap is stored in. For a list of available pixel formats, see the Native Pixel Formats topic.
%inst
Retrieves the pixel format of the bitmap source..

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The pixel format returned by this method is not necessarily the pixel
format the image is stored as. The codec may perform a format
conversion from the storage pixel format to an output pixel format.


%index
IWICBitmapSource_GetResolution
Retrieves the sampling rate between pixels and physical world measurements.
%group
COM misc / IWICBitmapSource
%prm
this, pDpiX, pDpiY
this : [comobj] IWICBitmapSource インターフェースの COM オブジェクト変数
pDpiX : [double] Type: double* A pointer that receives the x-axis dpi resolution.
pDpiY : [double] Type: double* A pointer that receives the y-axis dpi resolution.
%inst
Retrieves the sampling rate between pixels and physical world
measurements.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Some formats, such as GIF and ICO, do not have full DPI support. For
GIF, this method calculates the DPI values from the aspect ratio,
using a base DPI of (96.0, 96.0). The ICO format does not support DPI
at all, and the method always returns (96.0,96.0) for ICO images.
Additionally, WIC itself does not transform images based on the DPI
values in an image. It is up to the caller to transform an image
based on the resolution returned.


%index
IWICBitmapSource_CopyPalette
Retrieves the color table for indexed pixel formats.
%group
COM misc / IWICBitmapSource
%prm
this, pIPalette
this : [comobj] IWICBitmapSource インターフェースの COM オブジェクト変数
pIPalette : [comobj] Type: IWICPalette* An IWICPalette. A palette can be created using the CreatePalette method.
%inst
Retrieves the color table for indexed pixel formats.

[戻り値]
Type: HRESULT Returns one of the following values.
This doc was truncated.

[備考]
If the IWICBitmapSource is an IWICBitmapFrameDecode, the function may
return the image's global palette if a frame-level palette is not
available. The global palette may also be retrieved using the
CopyPalette method.


%index
IWICBitmapSource_CopyPixels
Instructs the object to produce pixels.
%group
COM misc / IWICBitmapSource
%prm
this, prc, cbStride, cbBufferSize, pbBuffer
this : [comobj] IWICBitmapSource インターフェースの COM オブジェクト変数
prc : [var] Type: const WICRect* The rectangle to copy. A NULL value specifies the entire bitmap.
cbStride : [int] Type: UINT The stride of the bitmap
cbBufferSize : [int] Type: UINT The size of the buffer.
pbBuffer : [int] Type: BYTE* A pointer to the buffer.
%inst
Instructs the object to produce pixels.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
CopyPixels is one of the two main image processing routines (the
other being Lock) triggering the actual processing. It instructs the
object to produce pixels according to its algorithm - this may
involve decoding a portion of a JPEG stored on disk, copying a block
of memory, or even analytically computing a complex gradient. The
algorithm is completely dependent on the object implementing the
interface.
The caller can restrict the operation to a rectangle of interest
(ROI) using the prc parameter. The ROI sub-rectangle must be fully
contained in the bounds of the bitmap. Specifying a NULL ROI implies
that the whole bitmap should be returned.
The caller controls the memory management and must provide an output
buffer (pbBuffer) for the results of the copy along with the buffer's
bounds (cbBufferSize). The cbStride parameter defines the count of
bytes between two vertically adjacent pixels in the output buffer.
The caller must ensure that there is sufficient buffer to complete
the call based on the width, height and pixel format of the bitmap
and the sub-rectangle provided to the copy method.
If the caller needs to perform numerous copies of an expensive
IWICBitmapSource such as a JPEG, it is recommended to create an
in-memory IWICBitmap first.
Codec Developer Remarks The callee must only write to the first
(prc->Width*bitsperpixel+7)/8 bytes of each line of the output buffer
(in this case, a line is a consecutive string of cbStride bytes).


%index
IWICColorContext_InitializeFromFilename
Initializes the color context from the given file.
%group
COM misc / IWICColorContext
%prm
this, wzFilename
this : [comobj] IWICColorContext インターフェースの COM オブジェクト変数
wzFilename : [wstr] Type: LPCWSTR The name of the file.
%inst
Initializes the color context from the given file.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Once a color context has been initialized, it can't be
re-initialized.


%index
IWICColorContext_InitializeFromMemory
Initializes the color context from a memory block.
%group
COM misc / IWICColorContext
%prm
this, pbBuffer, cbBufferSize
this : [comobj] IWICColorContext インターフェースの COM オブジェクト変数
pbBuffer : [int] Type: const BYTE* The buffer used to initialize the IWICColorContext.
cbBufferSize : [int] Type: UINT The size of the pbBuffer buffer.
%inst
Initializes the color context from a memory block.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Once a color context has been initialized, it can't be
re-initialized.


%index
IWICColorContext_InitializeFromExifColorSpace
Initializes the color context using an Exchangeable Image File (EXIF) color space.
%group
COM misc / IWICColorContext
%prm
this, value
this : [comobj] IWICColorContext インターフェースの COM オブジェクト変数
value : [int] Type: UINT The value of the EXIF color space.
%inst
Initializes the color context using an Exchangeable Image File (EXIF)
color space.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Once a color context has been initialized, it can't be
re-initialized.


%index
IWICColorContext_GetType
Retrieves the color context type. (IWICColorContext.GetType)
%group
COM misc / IWICColorContext
%prm
this, pType
this : [comobj] IWICColorContext インターフェースの COM オブジェクト変数
pType : [var] Type: WICColorContextType* A pointer that receives the WICColorContextType of the color context.
%inst
Retrieves the color context type. (IWICColorContext.GetType)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICColorContext_GetProfileBytes
Retrieves the color context profile.
%group
COM misc / IWICColorContext
%prm
this, cbBuffer, pbBuffer, pcbActual
this : [comobj] IWICColorContext インターフェースの COM オブジェクト変数
cbBuffer : [int] Type: UINT The size of the pbBuffer buffer.
pbBuffer : [int] Type: BYTE* A pointer that receives the color context profile.
pcbActual : [int] Type: UINT* A pointer that receives the actual buffer size needed to retrieve the entire color context profile.
%inst
Retrieves the color context profile.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Only use this method if the context type is WICColorContextProfile.
Calling this method with pbBuffer set to NULL will cause it to return
the required buffer size in pcbActual.


%index
IWICColorContext_GetExifColorSpace
Retrieves the Exchangeable Image File (EXIF) color space color context.
%group
COM misc / IWICColorContext
%prm
this, pValue
this : [comobj] IWICColorContext インターフェースの COM オブジェクト変数
pValue : [int] Type: UINT* A pointer that receives the EXIF color space color context.
%inst
Retrieves the Exchangeable Image File (EXIF) color space color
context.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This method should only be used when IWICColorContext::GetType
indicates WICColorContextExifColorSpace.


%index
IWICColorTransform_GetSize
IWICColorTransform::GetSize (vtable slot 3)
%group
COM misc / IWICColorTransform
%prm
this, puiWidth, puiHeight
this : [comobj] IWICColorTransform インターフェースの COM オブジェクト変数
puiWidth : [int] 
puiHeight : [int] 
%inst


%index
IWICColorTransform_GetPixelFormat
IWICColorTransform::GetPixelFormat (vtable slot 4)
%group
COM misc / IWICColorTransform
%prm
this, pPixelFormat
this : [comobj] IWICColorTransform インターフェースの COM オブジェクト変数
pPixelFormat : [var] 
%inst


%index
IWICColorTransform_GetResolution
IWICColorTransform::GetResolution (vtable slot 5)
%group
COM misc / IWICColorTransform
%prm
this, pDpiX, pDpiY
this : [comobj] IWICColorTransform インターフェースの COM オブジェクト変数
pDpiX : [double] 
pDpiY : [double] 
%inst


%index
IWICColorTransform_CopyPalette
IWICColorTransform::CopyPalette (vtable slot 6)
%group
COM misc / IWICColorTransform
%prm
this, pIPalette
this : [comobj] IWICColorTransform インターフェースの COM オブジェクト変数
pIPalette : [comobj] 
%inst


%index
IWICColorTransform_CopyPixels
IWICColorTransform::CopyPixels (vtable slot 7)
%group
COM misc / IWICColorTransform
%prm
this, prc, cbStride, cbBufferSize, pbBuffer
this : [comobj] IWICColorTransform インターフェースの COM オブジェクト変数
prc : [var] 
cbStride : [int] 
cbBufferSize : [int] 
pbBuffer : [int] 
%inst


%index
IWICColorTransform_Initialize
Initializes an IWICColorTransform with a IWICBitmapSource and transforms it from one IWICColorContext to another.
%group
COM misc / IWICColorTransform
%prm
this, pIBitmapSource, pIContextSource, pIContextDest, pixelFmtDest
this : [comobj] IWICColorTransform インターフェースの COM オブジェクト変数
pIBitmapSource : [comobj] Type: IWICBitmapSource* The bitmap source used to initialize the color transform.
pIContextSource : [comobj] Type: IWICColorContext* The color context source.
pIContextDest : [comobj] Type: IWICColorContext* The color context destination.
pixelFmtDest : [var] Type: REFWICPixelFormatGUID The GUID of the desired pixel format. This parameter is limited to a subset of the native WIC pixel formats, see Remarks for a list.
%inst
Initializes an IWICColorTransform with a IWICBitmapSource and
transforms it from one IWICColorContext to another.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The currently supported formats for the pIContextSource and
pixelFmtDest parameters are:
This doc was truncated.


%index
IWICComponentInfo_GetComponentType
Retrieves the component's WICComponentType.
%group
COM misc / IWICComponentInfo
%prm
this, pType
this : [comobj] IWICComponentInfo インターフェースの COM オブジェクト変数
pType : [var] Type: WICComponentType* A pointer that receives the WICComponentType.
%inst
Retrieves the component's WICComponentType.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICComponentInfo_GetCLSID
Retrieves the component's class identifier (CLSID)
%group
COM misc / IWICComponentInfo
%prm
this, pclsid
this : [comobj] IWICComponentInfo インターフェースの COM オブジェクト変数
pclsid : [var] Type: CLSID* A pointer that receives the component's CLSID.
%inst
Retrieves the component's class identifier (CLSID)

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICComponentInfo_GetSigningStatus
Retrieves the signing status of the component.
%group
COM misc / IWICComponentInfo
%prm
this, pStatus
this : [comobj] IWICComponentInfo インターフェースの COM オブジェクト変数
pStatus : [int] Type: DWORD* A pointer that receives the WICComponentSigning status of the component.
%inst
Retrieves the signing status of the component.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Signing is unused by WIC. Therefore, all components
WICComponentSigned. This function can be used to determine whether a
component has no binary component or has been added to the disabled
components list in the registry.


%index
IWICComponentInfo_GetAuthor
Retrieves the name of component's author.
%group
COM misc / IWICComponentInfo
%prm
this, cchAuthor, wzAuthor, pcchActual
this : [comobj] IWICComponentInfo インターフェースの COM オブジェクト変数
cchAuthor : [int] Type: UINT The size of the wzAuthor buffer.
wzAuthor : [wstr] Type: WCHAR* A pointer that receives the name of the component's author. The locale of the string depends on the value that the codec wrote to the registry at install time. For built-in components, these strings are always in English.
pcchActual : [int] Type: UINT* A pointer that receives the actual length of the component's authors name. The author name is optional; if an author name is not specified by the component, the length returned is 0.
%inst
Retrieves the name of component's author.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
If cchAuthor is 0 and wzAuthor is NULL, the required buffer size is
returned in pccchActual.


%index
IWICComponentInfo_GetVendorGUID
Retrieves the vendor GUID.
%group
COM misc / IWICComponentInfo
%prm
this, pguidVendor
this : [comobj] IWICComponentInfo インターフェースの COM オブジェクト変数
pguidVendor : [var] Type: GUID* A pointer that receives the component's vendor GUID.
%inst
Retrieves the vendor GUID.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICComponentInfo_GetVersion
Retrieves the component's version.
%group
COM misc / IWICComponentInfo
%prm
this, cchVersion, wzVersion, pcchActual
this : [comobj] IWICComponentInfo インターフェースの COM オブジェクト変数
cchVersion : [int] Type: UINT The size of the wzVersion buffer.
wzVersion : [wstr] Type: WCHAR* A pointer that receives a culture invariant string of the component's version.
pcchActual : [int] Type: UINT* A pointer that receives the actual length of the component's version. The version is optional; if a value is not specified by the component, the length returned is 0.
%inst
Retrieves the component's version.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
All built-in components return "1.0.0.0", except for pixel formats,
which do not have a version. If cchAuthor is 0 and wzAuthor is NULL,
the required buffer size is returned in pccchActual.


%index
IWICComponentInfo_GetSpecVersion
Retrieves the component's specification version.
%group
COM misc / IWICComponentInfo
%prm
this, cchSpecVersion, wzSpecVersion, pcchActual
this : [comobj] IWICComponentInfo インターフェースの COM オブジェクト変数
cchSpecVersion : [int] Type: UINT The size of the wzSpecVersion buffer.
wzSpecVersion : [wstr] Type: WCHAR* When this method returns, contain a culture invariant string of the component's specification version. The version form is NN.NN.NN.NN.
pcchActual : [int] Type: UINT* A pointer that receives the actual length of the component's specification version. The specification version is optional; if a value is not specified by the component, the length returned is 0.
%inst
Retrieves the component's specification version.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
All built-in components return "1.0.0.0", except for pixel formats,
which do not have a spec version. If cchAuthor is 0 and wzAuthor is
NULL, the required buffer size is returned in pccchActual.


%index
IWICComponentInfo_GetFriendlyName
Retrieves the component's friendly name, which is a human-readable display name for the component.
%group
COM misc / IWICComponentInfo
%prm
this, cchFriendlyName, wzFriendlyName, pcchActual
this : [comobj] IWICComponentInfo インターフェースの COM オブジェクト変数
cchFriendlyName : [int] Type: UINT The size of the wzFriendlyName buffer.
wzFriendlyName : [wstr] Type: WCHAR* A pointer that receives the friendly name of the component. The locale of the string depends on the value that the codec wrote to the registry at install time. For built-in components, these strings are always in English.
pcchActual : [int] Type: UINT* A pointer that receives the actual length of the component's friendly name.
%inst
Retrieves the component's friendly name, which is a human-readable
display name for the component.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
If cchFriendlyName is 0 and wzFriendlyName is NULL, the required
buffer size is returned in pccchActual.


%index
IWICFastMetadataEncoder_Commit
Finalizes metadata changes to the image stream.
%group
COM misc / IWICFastMetadataEncoder
%prm
this
this : [comobj] IWICFastMetadataEncoder インターフェースの COM オブジェクト変数
%inst
Finalizes metadata changes to the image stream.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
If the commit fails and returns WINCODEC_ERR_STREAMNOTAVAILABLE,
ensure that the image decoder was loaded using the
WICDecodeMetadataCacheOnDemand option. A fast metadata encoder is not
supported when the decoder is created using the
WICDecodeMetadataCacheOnLoad option. If the commit fails for any
reason, you will need to re-encode the image to ensure the new
metadata is added to the image.


%index
IWICFastMetadataEncoder_GetMetadataQueryWriter
Retrieves a metadata query writer for fast metadata encoding.
%group
COM misc / IWICFastMetadataEncoder
%prm
this, ppIMetadataQueryWriter
this : [comobj] IWICFastMetadataEncoder インターフェースの COM オブジェクト変数
ppIMetadataQueryWriter : [comobj] Type: IWICMetadataQueryWriter** When this method returns, contains a pointer to the fast metadata encoder's metadata query writer.
%inst
Retrieves a metadata query writer for fast metadata encoding.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICFormatConverter_GetSize
IWICFormatConverter::GetSize (vtable slot 3)
%group
COM misc / IWICFormatConverter
%prm
this, puiWidth, puiHeight
this : [comobj] IWICFormatConverter インターフェースの COM オブジェクト変数
puiWidth : [int] 
puiHeight : [int] 
%inst


%index
IWICFormatConverter_GetPixelFormat
IWICFormatConverter::GetPixelFormat (vtable slot 4)
%group
COM misc / IWICFormatConverter
%prm
this, pPixelFormat
this : [comobj] IWICFormatConverter インターフェースの COM オブジェクト変数
pPixelFormat : [var] 
%inst


%index
IWICFormatConverter_GetResolution
IWICFormatConverter::GetResolution (vtable slot 5)
%group
COM misc / IWICFormatConverter
%prm
this, pDpiX, pDpiY
this : [comobj] IWICFormatConverter インターフェースの COM オブジェクト変数
pDpiX : [double] 
pDpiY : [double] 
%inst


%index
IWICFormatConverter_CopyPalette
IWICFormatConverter::CopyPalette (vtable slot 6)
%group
COM misc / IWICFormatConverter
%prm
this, pIPalette
this : [comobj] IWICFormatConverter インターフェースの COM オブジェクト変数
pIPalette : [comobj] 
%inst


%index
IWICFormatConverter_CopyPixels
IWICFormatConverter::CopyPixels (vtable slot 7)
%group
COM misc / IWICFormatConverter
%prm
this, prc, cbStride, cbBufferSize, pbBuffer
this : [comobj] IWICFormatConverter インターフェースの COM オブジェクト変数
prc : [var] 
cbStride : [int] 
cbBufferSize : [int] 
pbBuffer : [int] 
%inst


%index
IWICFormatConverter_Initialize
Initializes the format converter.
%group
COM misc / IWICFormatConverter
%prm
this, pISource, dstFormat, dither, pIPalette, alphaThresholdPercent, paletteTranslate
this : [comobj] IWICFormatConverter インターフェースの COM オブジェクト変数
pISource : [comobj] Type: IWICBitmapSource* The input bitmap to convert
dstFormat : [var] Type: REFWICPixelFormatGUID The destination pixel format GUID.
dither : [int] Type: WICBitmapDitherType The WICBitmapDitherType used for conversion.
pIPalette : [comobj] Type: IWICPalette* The palette to use for conversion.
alphaThresholdPercent : [double] Type: double The alpha threshold to use for conversion.
paletteTranslate : [int] Type: WICBitmapPaletteType The palette translation type to use for conversion.
%inst
Initializes the format converter.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
If you do not have a predefined palette, you must first create one.
Use InitializeFromBitmap to create the palette object, then pass it
in along with your other parameters.
dither, pIPalette, alphaThresholdPercent, and paletteTranslate are
used to mitigate color loss when converting to a reduced bit-depth
format. For conversions that do not need these settings, the
following parameters values should be used: dither set to
WICBitmapDitherTypeNone, pIPalette set to NULL, alphaThresholdPercent
set to 0.0f, and paletteTranslate set to WICBitmapPaletteTypeCustom.
The basic algorithm involved when using an ordered dither requires a
fixed palette, found in the WICBitmapPaletteType enumeration, in a
specific order. Often, the actual palette provided for the output may
have a different ordering or some slight variation in the actual
colors. This is the case when using the Microsoft Windows palette
which has slight differences among versions of Windows.To provide for
this, a palette and a palette translation are given to the format
converter. The pIPalette is the actual destination palette to be used
and the paletteTranslate is a fixed palette. Once the conversion is
complete, the colors are mapped from the fixed palette to the actual
colors in pIPalette using a nearest color matching algorithm. If
colors in pIPalette do not closely match those in paletteTranslate,
the mapping may produce undesirable results.
WICBitmapDitherTypeOrdered4x4 can be useful in format conversions
from 8-bit formats to 5- or 6-bit formats as there is no way to
accurately convert color data. WICBitmapDitherTypeErrorDiffusion
selects the error diffusion algorithm and may be used with any
palette. If an arbitrary palette is provided, WICBitmapPaletteCustom
should be passed in as the paletteTranslate. Error diffusion often
provides superior results compared to the ordered dithering
algorithms especially when combined with the optimized palette
generation functionality on the IWICPalette. When converting a bitmap
which has an alpha channel, such as a Portable Network Graphics
(PNG), to 8bpp, the alpha channel is normally ignored. Any pixels
which were transparent in the original bitmap show up as black in the
final output because both transparent and black have pixel values of
zero in the respective formats. Some 8bpp content can contains an
alpha color; for instance, the Graphics Interchange Format (GIF)
format allows for a single palette entry to be used as a transparent
color. For this type of content, alphaThresholdPercent specifies what
percentage of transparency should map to the transparent color.
Because the alpha value is directly proportional to the opacity (not
transparency) of a pixel, the alphaThresholdPercent indicates what
level of opacity is mapped to the fully transparent color. For
instance, 9.8% implies that any pixel with an alpha value of less
than 25 will be mapped to the transparent color. A value of 100% maps
all pixels which are not fully opaque to the transparent color. Note
that the palette should provide a transparent color. If it does not,
the 'transparent' color will be the one closest to zero - often
black.


%index
IWICFormatConverter_CanConvert
Determines if the source pixel format can be converted to the destination pixel format.
%group
COM misc / IWICFormatConverter
%prm
this, srcPixelFormat, dstPixelFormat, pfCanConvert
this : [comobj] IWICFormatConverter インターフェースの COM オブジェクト変数
srcPixelFormat : [var] Type: REFWICPixelFormatGUID The source pixel format.
dstPixelFormat : [var] Type: REFWICPixelFormatGUID The destination pixel format.
pfCanConvert : [var] Type: BOOL* A pointer that receives a value indicating whether the source pixel format can be converted to the destination pixel format.
%inst
Determines if the source pixel format can be converted to the
destination pixel format.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICImagingFactory_CreateDecoderFromFilename
Creates a new instance of the IWICBitmapDecoder class based on the given file.
%group
COM misc / IWICImagingFactory
%prm
this, wzFilename, pguidVendor, dwDesiredAccess, metadataOptions
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
wzFilename : [wstr] Type: LPCWSTR A pointer to a null-terminated string that specifies the name of an object to create or open.
pguidVendor : [var] Type: const GUID* The GUID for the preferred decoder vendor. Use NULL if no preferred vendor.
dwDesiredAccess : [int] Type: DWORD The access to the object, which can be read, write, or both.
metadataOptions : [int] Type: WICDecodeOptions The WICDecodeOptions to use when creating the decoder.
%inst
Creates a new instance of the IWICBitmapDecoder class based on the
given file.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICImagingFactory_CreateDecoderFromStream
Creates a new instance of the IWICBitmapDecoder class based on the given IStream.
%group
COM misc / IWICImagingFactory
%prm
this, pIStream, pguidVendor, metadataOptions
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
pIStream : [comobj] Type: IStream* The stream to create the decoder from.
pguidVendor : [var] Type: const GUID* The GUID for the preferred decoder vendor. Use NULL if no preferred vendor.
metadataOptions : [int] Type: WICDecodeOptions The WICDecodeOptions to use when creating the decoder.
%inst
Creates a new instance of the IWICBitmapDecoder class based on the
given IStream.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICImagingFactory_CreateDecoderFromFileHandle
Creates a new instance of the IWICBitmapDecoder based on the given file handle.
%group
COM misc / IWICImagingFactory
%prm
this, hFile, pguidVendor, metadataOptions
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
hFile : [int] Type: ULONG_PTR The file handle to create the decoder from.
pguidVendor : [var] Type: const GUID* The GUID for the preferred decoder vendor. Use NULL if no preferred vendor.
metadataOptions : [int] Type: WICDecodeOptions The WICDecodeOptions to use when creating the decoder.
%inst
Creates a new instance of the IWICBitmapDecoder based on the given
file handle.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
When a decoder is created using this method, the file handle must
remain alive during the lifetime of the decoder.


%index
IWICImagingFactory_CreateComponentInfo
Creates a new instance of the IWICComponentInfo class for the given component class identifier (CLSID).
%group
COM misc / IWICImagingFactory
%prm
this, clsidComponent, ppIInfo
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
clsidComponent : [var] Type: REFCLSID The CLSID for the desired component.
ppIInfo : [comobj] Type: IWICComponentInfo** A pointer that receives a pointer to a new IWICComponentInfo.
%inst
Creates a new instance of the IWICComponentInfo class for the given
component class identifier (CLSID).

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICImagingFactory_CreateDecoder
Creates a new instance of IWICBitmapDecoder.
%group
COM misc / IWICImagingFactory
%prm
this, guidContainerFormat, pguidVendor
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
guidContainerFormat : [var] Type: REFGUID The GUID for the desired container format.
pguidVendor : [var] Type: const GUID* The GUID for the preferred encoder vendor.
%inst
Creates a new instance of IWICBitmapDecoder.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Other values may be available for both guidContainerFormat and
pguidVendor depending on the installed WIC-enabled encoders. The
values listed are those that are natively supported by the operating
system.


%index
IWICImagingFactory_CreateEncoder
Creates a new instance of the IWICBitmapEncoder class.
%group
COM misc / IWICImagingFactory
%prm
this, guidContainerFormat, pguidVendor
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
guidContainerFormat : [var] Type: REFGUID The GUID for the desired container format.
pguidVendor : [var] Type: const GUID* The GUID for the preferred encoder vendor.
%inst
Creates a new instance of the IWICBitmapEncoder class.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Other values may be available for both guidContainerFormat and
pguidVendor depending on the installed WIC-enabled encoders. The
values listed are those that are natively supported by the operating
system.


%index
IWICImagingFactory_CreatePalette
Creates a new instance of the IWICPalette class.
%group
COM misc / IWICImagingFactory
%prm
this, ppIPalette
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
ppIPalette : [comobj] Type: IWICPalette** A pointer that receives a pointer to a new IWICPalette.
%inst
Creates a new instance of the IWICPalette class.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICImagingFactory_CreateFormatConverter
Creates a new instance of the IWICFormatConverter class.
%group
COM misc / IWICImagingFactory
%prm
this, ppIFormatConverter
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
ppIFormatConverter : [comobj] Type: IWICFormatConverter** A pointer that receives a pointer to a new IWICFormatConverter.
%inst
Creates a new instance of the IWICFormatConverter class.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICImagingFactory_CreateBitmapScaler
Creates a new instance of an IWICBitmapScaler.
%group
COM misc / IWICImagingFactory
%prm
this, ppIBitmapScaler
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
ppIBitmapScaler : [comobj] Type: IWICBitmapScaler** A pointer that receives a pointer to a new IWICBitmapScaler.
%inst
Creates a new instance of an IWICBitmapScaler.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICImagingFactory_CreateBitmapClipper
Creates a new instance of an IWICBitmapClipper object.
%group
COM misc / IWICImagingFactory
%prm
this, ppIBitmapClipper
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
ppIBitmapClipper : [comobj] Type: IWICBitmapClipper** A pointer that receives a pointer to a new IWICBitmapClipper.
%inst
Creates a new instance of an IWICBitmapClipper object.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICImagingFactory_CreateBitmapFlipRotator
Creates a new instance of an IWICBitmapFlipRotator object.
%group
COM misc / IWICImagingFactory
%prm
this, ppIBitmapFlipRotator
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
ppIBitmapFlipRotator : [comobj] Type: IWICBitmapFlipRotator** A pointer that receives a pointer to a new IWICBitmapFlipRotator.
%inst
Creates a new instance of an IWICBitmapFlipRotator object.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICImagingFactory_CreateStream
Creates a new instance of the IWICStream class.
%group
COM misc / IWICImagingFactory
%prm
this, ppIWICStream
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
ppIWICStream : [comobj] Type: IWICStream** A pointer that receives a pointer to a new IWICStream.
%inst
Creates a new instance of the IWICStream class.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICImagingFactory_CreateColorContext
Creates a new instance of the IWICColorContext class.
%group
COM misc / IWICImagingFactory
%prm
this, ppIWICColorContext
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
ppIWICColorContext : [comobj] Type: IWICColorContext** A pointer that receives a pointer to a new IWICColorContext.
%inst
Creates a new instance of the IWICColorContext class.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICImagingFactory_CreateColorTransformer
Creates a new instance of the IWICColorTransform class.
%group
COM misc / IWICImagingFactory
%prm
this, ppIWICColorTransform
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
ppIWICColorTransform : [comobj] Type: IWICColorTransform** A pointer that receives a pointer to a new IWICColorTransform.
%inst
Creates a new instance of the IWICColorTransform class.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICImagingFactory_CreateBitmap
Creates an IWICBitmap object.
%group
COM misc / IWICImagingFactory
%prm
this, uiWidth, uiHeight, pixelFormat, option, ppIBitmap
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
uiWidth : [int] Type: UINT The width of the new bitmap .
uiHeight : [int] Type: UINT The height of the new bitmap.
pixelFormat : [var] Type: REFWICPixelFormatGUID The pixel format of the new bitmap.
option : [int] Type: WICBitmapCreateCacheOption The cache creation options of the new bitmap. This can be one of the values in the WICBitmapCreateCacheOption enumeration.
ppIBitmap : [comobj] Type: IWICBitmap** A pointer that receives a pointer to the new bitmap.
%inst
Creates an IWICBitmap object.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICImagingFactory_CreateBitmapFromSource
Creates a IWICBitmap from a IWICBitmapSource.
%group
COM misc / IWICImagingFactory
%prm
this, pIBitmapSource, option, ppIBitmap
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
pIBitmapSource : [comobj] Type: IWICBitmapSource* The IWICBitmapSource to create the bitmap from.
option : [int] Type: WICBitmapCreateCacheOption The cache options of the new bitmap.  This can be one of the values in the WICBitmapCreateCacheOption enumeration.
ppIBitmap : [comobj] Type: IWICBitmap** A pointer that receives a pointer to the new bitmap.
%inst
Creates a IWICBitmap from a IWICBitmapSource.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICImagingFactory_CreateBitmapFromSourceRect
Creates an IWICBitmap from a specified rectangle of an IWICBitmapSource.
%group
COM misc / IWICImagingFactory
%prm
this, pIBitmapSource, x, y, width, height, ppIBitmap
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
pIBitmapSource : [comobj] Type: IWICBitmapSource* The IWICBitmapSource to create the bitmap from.
x : [int] Type: UINT The horizontal coordinate of the upper-left corner of the rectangle.
y : [int] Type: UINT The vertical coordinate of the upper-left corner of the rectangle.
width : [int] Type: UINT The width of the rectangle and the new bitmap.
height : [int] Type: UINT The height of the rectangle and the new bitmap.
ppIBitmap : [comobj] Type: IWICBitmap** A pointer that receives a pointer to the new bitmap.
%inst
Creates an IWICBitmap from a specified rectangle of an
IWICBitmapSource.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Providing a rectangle that is larger than the source will produce
undefined results. This method always creates a separate copy of the
source image, similar to the cache option WICBitmapCacheOnLoad.


%index
IWICImagingFactory_CreateBitmapFromMemory
Creates an IWICBitmap from a memory block.
%group
COM misc / IWICImagingFactory
%prm
this, uiWidth, uiHeight, pixelFormat, cbStride, cbBufferSize, pbBuffer, ppIBitmap
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
uiWidth : [int] Type: UINT The width of the new bitmap.
uiHeight : [int] Type: UINT The height of the new bitmap.
pixelFormat : [var] Type: REFWICPixelFormatGUID The pixel format of the new bitmap.  For valid pixel formats, see Native Pixel Formats.
cbStride : [int] Type: UINT The number of bytes between successive scanlines in pbBuffer.
cbBufferSize : [int] Type: UINT The size of pbBuffer.
pbBuffer : [int] Type: BYTE* The buffer used to create the bitmap.
ppIBitmap : [comobj] Type: IWICBitmap** A pointer that receives a pointer to the new bitmap.
%inst
Creates an IWICBitmap from a memory block.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The size of the IWICBitmap to be created must be smaller than or
equal to the size of the image in pbBuffer. The stride of the
destination bitmap will equal the stride of the source data,
regardless of the width and height specified. The pixelFormat
parameter defines the pixel format for both the input data and the
output bitmap.


%index
IWICImagingFactory_CreateBitmapFromHBITMAP
Creates an IWICBitmap from a bitmap handle.
%group
COM misc / IWICImagingFactory
%prm
this, hBitmap, hPalette, options, ppIBitmap
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
hBitmap : [intptr] Type: HBITMAP A bitmap handle to create the bitmap from.
hPalette : [int] Type: HPALETTE A palette handle used to create the bitmap.
options : [int] Type: WICBitmapAlphaChannelOption The alpha channel options to create the bitmap.
ppIBitmap : [comobj] Type: IWICBitmap** A pointer that receives a pointer to the new bitmap.
%inst
Creates an IWICBitmap from a bitmap handle.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
For a non-palletized bitmap, set NULL for the hPalette parameter.


%index
IWICImagingFactory_CreateBitmapFromHICON
Creates an IWICBitmap from an icon handle.
%group
COM misc / IWICImagingFactory
%prm
this, hIcon, ppIBitmap
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
hIcon : [intptr] Type: HICON The icon handle to create the new bitmap from.
ppIBitmap : [comobj] Type: IWICBitmap** A pointer that receives a pointer to the new bitmap.
%inst
Creates an IWICBitmap from an icon handle.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICImagingFactory_CreateComponentEnumerator
Creates an IEnumUnknown object of the specified component types.
%group
COM misc / IWICImagingFactory
%prm
this, componentTypes, options, ppIEnumUnknown
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
componentTypes : [int] Type: DWORD The types of WICComponentType to enumerate.
options : [int] Type: DWORD The WICComponentEnumerateOptions used to enumerate the given component types.
ppIEnumUnknown : [comobj] Type: IEnumUnknown** A pointer that receives a pointer to a new component enumerator.
%inst
Creates an IEnumUnknown object of the specified component types.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Component types must be enumerated separately. Combinations of
component types and WICAllComponents are unsupported.


%index
IWICImagingFactory_CreateFastMetadataEncoderFromDecoder
Creates a new instance of the fast metadata encoder based on the given IWICBitmapDecoder.
%group
COM misc / IWICImagingFactory
%prm
this, pIDecoder, ppIFastEncoder
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
pIDecoder : [comobj] Type: IWICBitmapDecoder* The decoder to create the fast metadata encoder from.
ppIFastEncoder : [comobj] Type: IWICFastMetadataEncoder** When this method returns, contains a pointer to the new IWICFastMetadataEncoder.
%inst
Creates a new instance of the fast metadata encoder based on the
given IWICBitmapDecoder.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The Windows provided codecs do not support fast metadata encoding at
the decoder level, and only support fast metadata encoding at the
frame level. To create a fast metadata encoder from a frame, see
CreateFastMetadataEncoderFromFrameDecode.


%index
IWICImagingFactory_CreateFastMetadataEncoderFromFrameDecode
Creates a new instance of the fast metadata encoder based on the given image frame.
%group
COM misc / IWICImagingFactory
%prm
this, pIFrameDecoder, ppIFastEncoder
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
pIFrameDecoder : [comobj] Type: IWICBitmapFrameDecode* The IWICBitmapFrameDecode to create the IWICFastMetadataEncoder from.
ppIFastEncoder : [comobj] Type: IWICFastMetadataEncoder** When this method returns, contains a pointer to a new fast metadata encoder.
%inst
Creates a new instance of the fast metadata encoder based on the
given image frame.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
For a list of support metadata formats for fast metadata encoding,
see WIC Metadata Overview.


%index
IWICImagingFactory_CreateQueryWriter
Creates a new instance of a query writer.
%group
COM misc / IWICImagingFactory
%prm
this, guidMetadataFormat, pguidVendor, ppIQueryWriter
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
guidMetadataFormat : [var] Type: REFGUID The GUID for the desired metadata format.
pguidVendor : [var] Type: const GUID* The GUID for the preferred metadata writer vendor. Use NULL if no preferred vendor.
ppIQueryWriter : [comobj] Type: IWICMetadataQueryWriter** When this method returns, contains a pointer to a new IWICMetadataQueryWriter.
%inst
Creates a new instance of a query writer.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICImagingFactory_CreateQueryWriterFromReader
Creates a new instance of a query writer based on the given query reader. The query writer will be pre-populated with metadata from the query reader.
%group
COM misc / IWICImagingFactory
%prm
this, pIQueryReader, pguidVendor, ppIQueryWriter
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
pIQueryReader : [comobj] Type: IWICMetadataQueryReader* The IWICMetadataQueryReader to create the IWICMetadataQueryWriter from.
pguidVendor : [var] Type: const GUID* The GUID for the preferred metadata writer vendor. Use NULL if no preferred vendor.
ppIQueryWriter : [comobj] Type: IWICMetadataQueryWriter** When this method returns, contains a pointer to a new metadata writer.
%inst
Creates a new instance of a query writer based on the given query
reader. The query writer will be pre-populated with metadata from the
query reader.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICMetadataQueryReader_GetContainerFormat
Gets the metadata query readers container format.
%group
COM misc / IWICMetadataQueryReader
%prm
this, pguidContainerFormat
this : [comobj] IWICMetadataQueryReader インターフェースの COM オブジェクト変数
pguidContainerFormat : [var] Type: GUID* Pointer that receives the cointainer format GUID.
%inst
Gets the metadata query readers container format.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICMetadataQueryReader_GetLocation
Retrieves the current path relative to the root metadata block.
%group
COM misc / IWICMetadataQueryReader
%prm
this, cchMaxLength, wzNamespace, pcchActualLength
this : [comobj] IWICMetadataQueryReader インターフェースの COM オブジェクト変数
cchMaxLength : [int] Type: UINT The length of the wzNamespace buffer.
wzNamespace : [wstr] Type: WCHAR* Pointer that receives the current namespace location.
pcchActualLength : [int] Type: UINT* The actual buffer length that was needed to retrieve the current namespace location.
%inst
Retrieves the current path relative to the root metadata block.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
If you pass NULL to wzNamespace, GetLocation ignores cchMaxLength and
returns the required buffer length to store the path in the variable
that pcchActualLength points to.
If the query reader is relative to the top of the metadata hierarchy,
it will return a single-char string. If the query reader is relative
to a nested metadata block, this method will return the path to the
current query reader.


%index
IWICMetadataQueryReader_GetMetadataByName
Retrieves the metadata block or item identified by a metadata query expression.
%group
COM misc / IWICMetadataQueryReader
%prm
this, wzName, pvarValue
this : [comobj] IWICMetadataQueryReader インターフェースの COM オブジェクト変数
wzName : [wstr] Type: LPCWSTR The query expression to the requested metadata block or item.
pvarValue : [int] Type: PROPVARIANT* When this method returns, contains the metadata block or item requested.
%inst
Retrieves the metadata block or item identified by a metadata query
expression.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
GetMetadataByName uses metadata query expressions to access embedded
metadata. For more information on the metadata query language, see
the Metadata Query Language Overview. If multiple blocks or items
exist that are expressed by the same query expression, the first
metadata block or item found will be returned.


%index
IWICMetadataQueryReader_GetEnumerator
Gets an enumerator of all metadata items at the current relative location within the metadata hierarchy.
%group
COM misc / IWICMetadataQueryReader
%prm
this, ppIEnumString
this : [comobj] IWICMetadataQueryReader インターフェースの COM オブジェクト変数
ppIEnumString : [comobj] Type: IEnumString** A pointer to a variable that receives a pointer to the IEnumString interface for the enumerator that contains query strings that can be used in the current IWICMetadataQueryReader.
%inst
Gets an enumerator of all metadata items at the current relative
location within the metadata hierarchy.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The retrieved enumerator only contains query strings for the metadata
blocks and items in the current level of the hierarchy.


%index
IWICMetadataQueryWriter_GetContainerFormat
IWICMetadataQueryWriter::GetContainerFormat (vtable slot 3)
%group
COM misc / IWICMetadataQueryWriter
%prm
this, pguidContainerFormat
this : [comobj] IWICMetadataQueryWriter インターフェースの COM オブジェクト変数
pguidContainerFormat : [var] 
%inst


%index
IWICMetadataQueryWriter_GetLocation
IWICMetadataQueryWriter::GetLocation (vtable slot 4)
%group
COM misc / IWICMetadataQueryWriter
%prm
this, cchMaxLength, wzNamespace, pcchActualLength
this : [comobj] IWICMetadataQueryWriter インターフェースの COM オブジェクト変数
cchMaxLength : [int] 
wzNamespace : [wstr] 
pcchActualLength : [int] 
%inst


%index
IWICMetadataQueryWriter_GetMetadataByName
IWICMetadataQueryWriter::GetMetadataByName (vtable slot 5)
%group
COM misc / IWICMetadataQueryWriter
%prm
this, wzName, pvarValue
this : [comobj] IWICMetadataQueryWriter インターフェースの COM オブジェクト変数
wzName : [wstr] 
pvarValue : [int] 
%inst


%index
IWICMetadataQueryWriter_GetEnumerator
IWICMetadataQueryWriter::GetEnumerator (vtable slot 6)
%group
COM misc / IWICMetadataQueryWriter
%prm
this, ppIEnumString
this : [comobj] IWICMetadataQueryWriter インターフェースの COM オブジェクト変数
ppIEnumString : [comobj] 
%inst


%index
IWICMetadataQueryWriter_SetMetadataByName
Sets a metadata item to a specific location.
%group
COM misc / IWICMetadataQueryWriter
%prm
this, wzName, pvarValue
this : [comobj] IWICMetadataQueryWriter インターフェースの COM オブジェクト変数
wzName : [wstr] Type: LPCWSTR The name of the metadata item.
pvarValue : [int] Type: const PROPVARIANT* The metadata to set.
%inst
Sets a metadata item to a specific location.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
SetMetadataByName uses metadata query expressions to remove metadata.
For more information on the metadata query language, see the Metadata
Query Language Overview. If the value set is a nested metadata block
then use variant type VT_UNKNOWN and pvarValue pointing to the
IWICMetadataQueryWriter of the new metadata block. The ordering of
metadata items is at the discretion of the query writer since
relative locations are not specified.


%index
IWICMetadataQueryWriter_RemoveMetadataByName
Removes a metadata item from a specific location using a metadata query expression.
%group
COM misc / IWICMetadataQueryWriter
%prm
this, wzName
this : [comobj] IWICMetadataQueryWriter インターフェースの COM オブジェクト変数
wzName : [wstr] Type: LPCWSTR The name of the metadata item to remove.
%inst
Removes a metadata item from a specific location using a metadata
query expression.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
RemoveMetadataByName uses metadata query expressions to remove
metadata. For more information on the metadata query language, see
the Metadata Query Language Overview. If the metadata item is a
metadata block, it is removed from the metadata hierarchy.


%index
IWICPalette_InitializePredefined
Initializes the palette to one of the pre-defined palettes specified by WICBitmapPaletteType and optionally adds a transparent color.
%group
COM misc / IWICPalette
%prm
this, ePaletteType, fAddTransparentColor
this : [comobj] IWICPalette インターフェースの COM オブジェクト変数
ePaletteType : [int] Type: WICBitmapPaletteType The desired pre-defined palette type.
fAddTransparentColor : [int] Type: BOOL The optional transparent color to add to the palette. If no transparent color is needed, use 0. When initializing to a grayscale or black and white palette, set this parameter to FALSE.
%inst
Initializes the palette to one of the pre-defined palettes specified
by WICBitmapPaletteType and optionally adds a transparent color.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
If a transparent color is added to a palette, the palette is no
longer predefined and is returned as WICBitmapPaletteTypeCustom. For
palettes with less than 256 entries, the transparent entry is added
to the end of the palette (that is, a 16-color palette becomes a
17-color palette). For palettes with 256 colors, the transparent
palette entry will replace the last entry in the pre-defined palette.


%index
IWICPalette_InitializeCustom
Initializes a palette to the custom color entries provided.
%group
COM misc / IWICPalette
%prm
this, pColors, cCount
this : [comobj] IWICPalette インターフェースの COM オブジェクト変数
pColors : [int] Type: WICColor* Pointer to the color array.
cCount : [int] Type: UINT The number of colors in pColors.
%inst
Initializes a palette to the custom color entries provided.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
If a transparent color is required, provide it as part of the custom
entries. To add a transparent value to the palette, its alpha value
must be 0 (0x00RRGGBB).
The entry count is limited to 256.


%index
IWICPalette_InitializeFromBitmap
Initializes a palette using a computed optimized values based on the reference bitmap.
%group
COM misc / IWICPalette
%prm
this, pISurface, cCount, fAddTransparentColor
this : [comobj] IWICPalette インターフェースの COM オブジェクト変数
pISurface : [comobj] Type: IWICBitmapSource* Pointer to the source bitmap.
cCount : [int] Type: UINT The number of colors to initialize the palette with.
fAddTransparentColor : [int] Type: BOOL A value to indicate whether to add a transparent color.
%inst
Initializes a palette using a computed optimized values based on the
reference bitmap.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The resulting palette contains the specified number of colors which
best represent the colors present in the bitmap. The algorithm
operates on the opaque RGB color value of each pixel in the reference
bitmap and hence ignores any alpha values. If a transparent color is
required, set the fAddTransparentColor parameter to TRUE and one
fewer optimized color will be computed, reducing the colorCount, and
a fully transparent color entry will be added.


%index
IWICPalette_InitializeFromPalette
Initialize the palette based on a given palette.
%group
COM misc / IWICPalette
%prm
this, pIPalette
this : [comobj] IWICPalette インターフェースの COM オブジェクト変数
pIPalette : [comobj] Type: IWICPalette* Pointer to the source palette.
%inst
Initialize the palette based on a given palette.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICPalette_GetType
Retrieves the WICBitmapPaletteType that describes the palette.
%group
COM misc / IWICPalette
%prm
this, pePaletteType
this : [comobj] IWICPalette インターフェースの COM オブジェクト変数
pePaletteType : [var] Type: WICBitmapPaletteType* Pointer that receives the palette type of the bimtap.
%inst
Retrieves the WICBitmapPaletteType that describes the palette.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
WICBitmapPaletteCustom is used for palettes initialized from both
InitializeCustom and InitializeFromBitmap. There is no distinction is
made between optimized and custom palettes.


%index
IWICPalette_GetColorCount
Retrieves the number of colors in the color table.
%group
COM misc / IWICPalette
%prm
this, pcCount
this : [comobj] IWICPalette インターフェースの COM オブジェクト変数
pcCount : [int] Type: UINT* Pointer that receives the number of colors in the color table.
%inst
Retrieves the number of colors in the color table.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICPalette_GetColors
Fills out the supplied color array with the colors from the internal color table. The color array should be sized according to the return results from GetColorCount.
%group
COM misc / IWICPalette
%prm
this, cCount, pColors, pcActualColors
this : [comobj] IWICPalette インターフェースの COM オブジェクト変数
cCount : [int] Type: UINT The size of the pColors array.
pColors : [int] Type: WICColor* Pointer that receives the colors of the palette.
pcActualColors : [int] Type: UINT* The actual size needed to obtain the palette colors.
%inst
Fills out the supplied color array with the colors from the internal
color table. The color array should be sized according to the return
results from GetColorCount.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICPalette_IsBlackWhite
Retrieves a value that describes whether the palette is black and white.
%group
COM misc / IWICPalette
%prm
this, pfIsBlackWhite
this : [comobj] IWICPalette インターフェースの COM オブジェクト変数
pfIsBlackWhite : [var] Type: BOOL* A pointer to a variable  that receives a boolean value that indicates whether the palette is black and white. TRUE indicates that the palette is black and white; otherwise, FALSE.
%inst
Retrieves a value that describes whether the palette is black and
white.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
A palette is considered to be black and white only if it contains
exactly two entries, one full black (0xFF000000) and one full white
(0xFFFFFFF).


%index
IWICPalette_IsGrayscale
Retrieves a value that describes whether a palette is grayscale.
%group
COM misc / IWICPalette
%prm
this, pfIsGrayscale
this : [comobj] IWICPalette インターフェースの COM オブジェクト変数
pfIsGrayscale : [var] Type: BOOL* A pointer to a variable that receives a boolean value that indicates whether the palette is grayscale. TRUE indicates that the palette is grayscale; otherwise FALSE.
%inst
Retrieves a value that describes whether a palette is grayscale.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
A palette is considered grayscale only if, for every entry, the alpha
value is 0xFF and the red, green and blue values match.


%index
IWICPalette_HasAlpha
Indicates whether the palette contains an entry that is non-opaque (that is, an entry with an alpha that is less than 1).
%group
COM misc / IWICPalette
%prm
this, pfHasAlpha
this : [comobj] IWICPalette インターフェースの COM オブジェクト変数
pfHasAlpha : [var] Type: BOOL* Pointer that receives TRUE if the palette contains a transparent color; otherwise, FALSE.
%inst
Indicates whether the palette contains an entry that is non-opaque
(that is, an entry with an alpha that is less than 1).

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
Various image formats support alpha in different ways. PNG has full
alpha support by supporting partially transparent palette entries.
GIF stores colors as 24bpp, without alpha, but allows one palette
entry to be specified as fully transparent. If a palette has multiple
fully transparent entries (0x00RRGGBB), GIF will use the last one as
its transparent index.


%index
IWICStream_Read
IWICStream::Read (vtable slot 3)
%group
COM misc / IWICStream
%prm
this, pv, cb, pcbRead
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
pv : [intptr] 
cb : [int] 
pcbRead : [var] 
%inst


%index
IWICStream_Write
IWICStream::Write (vtable slot 4)
%group
COM misc / IWICStream
%prm
this, pv, cb, pcbWritten
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
pv : [intptr] 
cb : [int] 
pcbWritten : [var] 
%inst


%index
IWICStream_Seek
IWICStream::Seek (vtable slot 5)
%group
COM misc / IWICStream
%prm
this, dlibMove, dwOrigin, plibNewPosition
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
dlibMove : [int64] 
dwOrigin : [int] 
plibNewPosition : [var] 
%inst


%index
IWICStream_SetSize
IWICStream::SetSize (vtable slot 6)
%group
COM misc / IWICStream
%prm
this, libNewSize
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
libNewSize : [int64] 
%inst


%index
IWICStream_CopyTo
IWICStream::CopyTo (vtable slot 7)
%group
COM misc / IWICStream
%prm
this, pstm, cb, pcbRead, pcbWritten
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
pstm : [comobj] 
cb : [int64] 
pcbRead : [var] 
pcbWritten : [var] 
%inst


%index
IWICStream_Commit
IWICStream::Commit (vtable slot 8)
%group
COM misc / IWICStream
%prm
this, grfCommitFlags
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
grfCommitFlags : [int] 
%inst


%index
IWICStream_Revert
IWICStream::Revert (vtable slot 9)
%group
COM misc / IWICStream
%prm
this
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
%inst


%index
IWICStream_LockRegion
IWICStream::LockRegion (vtable slot 10)
%group
COM misc / IWICStream
%prm
this, libOffset, cb, dwLockType
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
libOffset : [int64] 
cb : [int64] 
dwLockType : [int] 
%inst


%index
IWICStream_UnlockRegion
IWICStream::UnlockRegion (vtable slot 11)
%group
COM misc / IWICStream
%prm
this, libOffset, cb, dwLockType
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
libOffset : [int64] 
cb : [int64] 
dwLockType : [int] 
%inst


%index
IWICStream_Stat
IWICStream::Stat (vtable slot 12)
%group
COM misc / IWICStream
%prm
this, pstatstg, grfStatFlag
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
pstatstg : [var] 
grfStatFlag : [int] 
%inst


%index
IWICStream_Clone
IWICStream::Clone (vtable slot 13)
%group
COM misc / IWICStream
%prm
this, ppstm
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
ppstm : [comobj] 
%inst


%index
IWICStream_InitializeFromIStream
Initializes a stream from another stream. Access rights are inherited from the underlying stream.
%group
COM misc / IWICStream
%prm
this, pIStream
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
pIStream : [comobj] Type: IStream* The initialize stream.
%inst
Initializes a stream from another stream. Access rights are inherited
from the underlying stream.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.


%index
IWICStream_InitializeFromFilename
Initializes a stream from a particular file.
%group
COM misc / IWICStream
%prm
this, wzFileName, dwDesiredAccess
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
wzFileName : [wstr] Type: LPCWSTR The file used to initialize the stream.
dwDesiredAccess : [int] Type: DWORD The desired file access mode.
%inst
Initializes a stream from a particular file.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The IWICStream interface methods do not enable you to provide a file
sharing option. To create a shared file stream for an image, use the
SHCreateStreamOnFileEx function. This stream can then be used to
create an IWICBitmapDecoder using the CreateDecoderFromStream method.


%index
IWICStream_InitializeFromMemory
Initializes a stream to treat a block of memory as a stream. The stream cannot grow beyond the buffer size.
%group
COM misc / IWICStream
%prm
this, pbBuffer, cbBufferSize
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
pbBuffer : [int] Type: BYTE* Pointer to the buffer used to initialize the stream.
cbBufferSize : [int] Type: DWORD The size of buffer.
%inst
Initializes a stream to treat a block of memory as a stream. The
stream cannot grow beyond the buffer size.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
This method should be avoided whenever possible. The caller is
responsible for ensuring the memory block is valid for the lifetime
of the stream when using InitializeFromMemory. A workaround for this
behavior is to create an IStream and use InitializeFromIStream to
create the IWICStream. If you require a growable memory stream, use
CreateStreamOnHGlobal.


%index
IWICStream_InitializeFromIStreamRegion
Initializes the stream as a substream of another stream.
%group
COM misc / IWICStream
%prm
this, pIStream, ulOffset, ulMaxSize
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
pIStream : [comobj] Type: IStream* Pointer to the input stream.
ulOffset : [int64] Type: ULARGE_INTEGER The stream offset used to create the new stream.
ulMaxSize : [int64] Type: ULARGE_INTEGER The maximum size of the stream.
%inst
Initializes the stream as a substream of another stream.

[戻り値]
Type: HRESULT If this method succeeds, it returns S_OK. Otherwise, it
returns an HRESULT error code.

[備考]
The stream functions with its own stream position, independent of the
underlying stream but restricted to a region. All seek positions are
relative to the sub region. It is allowed, though not recommended, to
have multiple writable sub streams overlapping the same range.

